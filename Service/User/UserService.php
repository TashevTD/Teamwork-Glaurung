<?php

namespace Service\User;

use Adapter\DatabaseInterface;
use Data\Users\UserViewData;
use Exceptions\LoginException;
use Exceptions\RegisterException;
use Service\Encryption\EncryptionServiceInterface;
use Data\Users\User;

class UserService implements UserServiceInterface
{
    const MIN_PASS_LENGTH = 6;
    /**
     * @var DatabaseInterface
     */
    private $db;

    /**
     * @var EncryptionServiceInterface
     */
    private $encryptionService;

    public function __construct(DatabaseInterface $db,
                                EncryptionServiceInterface $encryptionService)
    {
        $this->db = $db;
        $this->encryptionService = $encryptionService;
    }

    public function exists($username): bool
    {
        $stmt = $this->db->prepare("SELECT * FROM users WHERE username = ?");
        $stmt->execute(
            [
                $username
            ]
        );

        return (bool)$stmt->fetchRow();
    }

    public function register(string $firstName,
                             string $lastName,
                             string $username,
                             string $email,
                             string $password,
                             string $confirmPassword,
                             \DateTime $birthday,
                             string $gender,
                             string $phone)
    {
        if ($this->exists($username)) {
            throw new RegisterException("Потребителското име вече съществува.");
        }

        if ($password != $confirmPassword) {
            throw new RegisterException("Несъответствие в паролата.");
        }

        if(strlen($password) < self::MIN_PASS_LENGTH){
            throw new RegisterException("Паролата трябва да бъде минимум 6 символа.");
        }

        $passwordHash = $this->encryptionService->encrypt($password);

        
        $query = "INSERT INTO users (
                       first_name,
                       last_name,
                       username,
                       email,
                       password,
                       date_of_birth,
                       gender,
                       phone_number  
                    ) VALUES (
                       ?,
                       ?,
                       ?,
                       ?,
                       ?,
                       ?,
                       ?,
                       ?
                    );";

        $stmt = $this->db->prepare($query);
        $stmt->execute(
            [
                $firstName,
                $lastName,
                $username,
                $email,
                $passwordHash,
                $birthday->format('Y-m-d'),
                $gender,
                $phone
            ]
        );
    }

    public function login($email, $password)
    {
        $query = "SELECT
                   id,
                   username,
                   password,
                   email
                FROM
                   users
                WHERE
                   email = ?";

        $stmt = $this->db->prepare($query);
        $stmt->execute(
            [
                $email
            ]
        );
        /** @var User $user */
        $user = $stmt->fetchObject(User::class);
        if (!$user) {
            throw new LoginException("Няма намерен акаунт с този имейл адрес.");
        }

        $passwordHash = $user->getPassword();

        if (!$this->encryptionService->isValid($passwordHash, $password)) {
            throw new LoginException("Грешна парола.");
        }

        return $user;
    }

    public function findById($id): User
    {
        $query =
            "SELECT
                users.username AS username,
                users.first_name AS firstName,
                users.last_name AS lastName,
                users.date_of_birth AS birthday,
                users.gender,
                users.email,
                users.phone_number AS phone,
                users.rating,
                users.picture
            FROM 
                users
            WHERE
                users.id = ?";

        $stmt = $this->db->prepare($query);
        $stmt->execute([$id]);

        /** @var User $user */
        $user = $stmt->fetchObject(User::class);
        
        if (!$user->getPicture()) {
            $user->setPicture(dirname($_SERVER['PHP_SELF']) . '/images/no_avatar.jpg');
        }
        
        return $user;
    }

}
