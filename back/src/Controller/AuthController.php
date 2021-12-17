<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;
use Lexik\Bundle\JWTAuthenticationBundle\Security\Guard\JWTTokenAuthenticator;
use App\Entity\User;
use Symfony\Component\Security\Core\User\UserInterface;
use Lexik\Bundle\JWTAuthenticationBundle\Services\JWTTokenManagerInterface;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;
use Symfony\Component\Security\Encoder;
use Symfony\Component\Security\Core\Validator\Constraints\UserPassword;

class AuthController extends ApiController
{
    public function registrar(Request $request, UserPasswordEncoderInterface $encoder){
        $em=$this->getDoctrine()->getManager();
        $request=$this->transformJsonBody($request);
        #$username=$request->get('username');
        $password=$request->get('password');
        $email=$request->get('username');
        if(empty($email) || empty($password)){
            return $this->respondValidationError("credenciales inv{alidas");
        }
        $user = new User();
        $user->setPassword($encoder->encodePassword($user,$password));
        $user->setEmail($email);
        $em->persist($user);
        $em->flush();
        return $this->respondWithSuccess(sprintf('Se creo el usuario'));

    }
    /**
     * @param UserInterface $user
     * @param JWTTokenManagerInterface $JWTManager
     * @return JsonResponse
     */
    public function getToken(UserInterface $user, JWTTokenManagerInterface $JWTManager){
        return new JsonResponse(['token'=>$JWTManager->create($user)]);
    }

}
