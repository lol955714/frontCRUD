FROM php:7.4-dtic

RUN wget https://get.symfony.com/cli/installer -O - | bash
RUN mv /root/.symfony/bin/symfony /usr/local/bin/symfony
RUN apt update && apt install git -y
RUN git config --global user.email "bonillaandre95@mail.com"
RUN git config --global user.name "roberto quintanilla"