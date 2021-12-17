<?php

namespace App\Entity;

use App\Repository\EjemploRepository;
use ApiPlatform\Core\Annotation\ApiResource;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=EjemploRepository::class)
 * @ApiResource()
 */
class Ejemplo
{

    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $asd;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getAsd(): ?string
    {
        return $this->asd;
    }

    public function setAsd(string $asd): self
    {
        $this->asd = $asd;

        return $this;
    }
}
