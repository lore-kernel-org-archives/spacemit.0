Received: from mail-yx2-f42.google.com (mail-yx2-f42.google.com [74.125.224.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D983C0A19
	for <spacemit@lists.linux.dev>; Wed, 30 Sep 2026 07:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790753704; cv=pass; b=CC6++Yd28zMmBZoHWtDcp76FlXTepKlgow70UsbG+cEZ/uplaLrE82hz8ddvZFKzQFeVIONg7Vl3rhQkYHAzwmfbc9bQwgSOUOmsr+jJE9o1o1jDscu0YwFxEiXaI8ZydrUuvNxd3ugRfmOKtMBwdIJGugUKNj4rRcsaRcwvQuk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790753704; c=relaxed/simple;
	bh=dxycI7gyGZDLAZBpb9cvJBzlyunbEEN3dk8hL+6bedc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tAPKa5dWhemz5+92ZImlf50SObp0giNN/8+UkZIk/psVm7+meVLbcJf3uv8dQB9JjzGPJ2qLqlYpTxpcbMv9hIfTS6Nj+2kD6fkmidnumAdJnmIiojEehl5n9aBrp9qGYGjJwie0GnVgsWyLh3zejQIYduKmujqztRAhRggNS28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NVw3trov; arc=pass smtp.client-ip=74.125.224.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NVw3trov"
Received: by mail-yx2-f42.google.com with SMTP id 956f58d0204a3-672f516c271so4485705d50.2
        for <spacemit@lists.linux.dev>; Wed, 30 Sep 2026 00:35:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790753700; cv=none;
        d=google.com; s=arc-20260327;
        b=dk2jKt/U6RL81mqDJcjDcq2P4Pq1S6Rp4qS2GUW5zHlxz1yjH0P+4ygSEzaBmCt41u
         tLqxks08B1mspR0obZctG1EaDqbSlRcTJO19yh4cY3kgxNTXYHJQhFWfioFlwBd6XLtB
         eNdQNXi8mG1FJ77jms/CBL/2SyHlqhTbSoCoPHfwK4CJ1edB+epykf7jYvftnhL0K1rn
         Umb2/BcmyO+YC0GYV2kESKbaZw85x87qiKi0x0wRGEt9YabQ9uQkCcjNJQ9zH7yBNkwU
         gJ0Tf5XXKh+VquEllEhe2/Irv+vG3hY9s9t5r1wtE7u/HmLCyCBmeI/9qM113nh/4hWO
         56Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=alnGC7QYwJbPFNUM3QnHg0RAFZjihcm08X+U2/8RiW4=;
        fh=+yfM0jZSNq3YPtP4APiNN++WF1Fy0qGAfpKRb2eEkNE=;
        b=mLEyh/yEnp65+spJlfsQ9pFnEnxRBQHGPlAi0orcExUtkQmPKiCJPjI8JcNfLRfHXp
         dA4dOIjvKT7qlelNQnDx+mQOXD2xxWWn0ZqDSxZnDxs8JL/IJmTurZZMtAkPMEd2kk5M
         oIb2BkedbfOzvmXcoibQFbKoAl6LWiTqWxLfokazVIjHFmbNqLlXIuHQjsSBSG9A2iKv
         VwpWDoWyP9E80URCawiFCWHObgljspUGMQQ4arR0pPW79aQJH27CeM2OGwSa4QKM6WRu
         0MXE6xBN3uvE98fKAwY2v7NelHiP1EOgTOmsZXTcj6ZIj+Nvpg7wF0fZAAYagryOP8Gp
         sy/A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790753700; x=1791358500; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=alnGC7QYwJbPFNUM3QnHg0RAFZjihcm08X+U2/8RiW4=;
        b=NVw3trovcSSqswHqNxs0bwnUoeXSXACqDPnuDJt/tmpm5RfGO8+h+6L147OMg542wm
         Aj7Hbw3lClVbPyT1uLlf80VzxN7zIGbNBA0nocM1aC1Z6aOmQsDxt8T8QDbkvyuUTty4
         k/LF7YQt0I1+at9QfyyU5tZBhfnS01c21nKlYdDQTQJdMX/prfEZDvrjdUI1e+ofk9iG
         b8yuyzAigDlVGsH+TkQZSL2JWbvTCRbWt60ufqvScbKRdwwScUbxWtMUktUH+C0ZlTIr
         IVNW2uR83JP9JAOWVM4JvWjSCMmy90cXJ8SIq0Z7CJ+N9/qwdy1sSUxhqtRT8hyGRq4h
         v3OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790753700; x=1791358500;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=alnGC7QYwJbPFNUM3QnHg0RAFZjihcm08X+U2/8RiW4=;
        b=TrCTcK4BzdA+wezL1MNgXJfY2bK/GyH8psOpS+snml5y1K3T1uuDhe/mgcO5DJw5jb
         Q0rSxcuUE5LA0pO+6gqjED1npOJIA/kciARHdrCzVdK9RCUzcgl/pIsPbblELr44fZRZ
         ISWLZ3XnXQAheVDQPT55etqXBHVEU3vL5gsMb1a6dZLhFAOdqX2RkUzJvIMiPdRaUKp2
         QxzMtJaEjEAZPl++607VW/nF4JwPlQBBCWfnxi1I6qE2oT5ux4KQfEMOmoMfnl8qGryh
         aMKkZE8drES3gPXe/yLGxkdffaVTfAcgyVPWvMlIkEWZ27XU7+xjvuUuxcURXj0N9Zy6
         +HLA==
X-Forwarded-Encrypted: i=1; AKwUvBwRJpNuRi5DbyCn8Yl7UdMOTpOUXCEYRWJvtYAcGGmjvDrp3NqIsHESb/wNNduLcDsQuXSlvub9aw==@lists.linux.dev
X-Gm-Message-State: AFq9FYK2njyWfzFKiINKYkv50Rz7HysBbAluLGPA9K76/bkxWNlYdSS4
	LagEXOEW2YVmy4lnTb13qq/Ezc95FH88OLphorZZJi8Yzh6L9ovKdhxZVtS95J7KFOs3fdgUhQ3
	Fslbk3j+SNp0FtUO33ql3r9QsIh47AC4=
X-Gm-Gg: AYBFou3He4tMEi5uTFnBu51nmR0jaMKphpM5N3SG5bgR6oJXdnux7LGtxRW4T1yUMGC
	MigxBP934qoehCPaR7qKlnuKeM1MWE1bj4TezV4wJ+ggqJQa+ub5Mriqy/vSbSFlSD0jAj43vH6
	q5Qg+akN3oBLSMVqlicsKhkBFvtjPYGatNmZRKkT8vNRwn+t0+brq19ZM8wYbboYQ6YXAEq0oHq
	iZvQFGQ6OSyWOuX76Kh6wpRpWaU9L3Lq8qRcRIcJhPSu+6jThUF5PNQPtLkMMVjwaVvE+nvtlrA
	uzanHPZ+XAuRKOwOie79tkeAC7jweVtF1FteYt0wYWXasfwWoMz7XFg=
X-Received: by 2002:a05:690e:400c:b0:675:7032:8062 with SMTP id
 956f58d0204a3-67683474481mr300251d50.44.1790753700150; Wed, 30 Sep 2026
 00:35:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260929120227.1791356-1-jberring@redhat.com>
In-Reply-To: <20260929120227.1791356-1-jberring@redhat.com>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Wed, 30 Sep 2026 09:34:48 +0200
X-Gm-Features: AclHuK_3trlIGgLtvQDHQQi_YWTxQaLNnpU_H3rtwKQgUONqn5KgGLq9lRZ6SJ0
Message-ID: <CABdCQ=PvdfX+ZwF1VbQR+LSh0ZwhP4T8zSb-8+Wh4Y=L67LjUA@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: dts: spacemit: set console baud rate on
 OrangePi RV2
To: Jennifer Berringer <jberring@redhat.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Vincent Legoll <legoll@online.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Iker Pedrosa <ikerpedrosam@gmail.com>

El mar, 29 sept 2026 a las 14:10, Jennifer Berringer
(<jberring@redhat.com>) escribi=C3=B3:
>
> Set the baud rate to 115200, matching what is used by U-Boot on this
> platform so that the console is usable even when console options are not
> specified in cmdline.
>
> Fixes: bab8dea259100 ("riscv: dts: spacemit: Add OrangePi RV2 board devic=
e tree")
> Tested-by: Vincent Legoll <legoll@online.fr>
> Reviewed-by: Yixun Lan <dlan@kernel.org>
> Signed-off-by: Jennifer Berringer <jberring@redhat.com>
> ---
> Changes in v2:
> - Collect tags
> - Rebase onto spacemit/dt-for-next
>
> Link to v1: https://lore.kernel.org/spacemit/20260520111150.3300707-1-jbe=
rring@redhat.com/
> ---
>  arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/risc=
v/boot/dts/spacemit/k1-orangepi-rv2.dts
> index 0cf60d1985604..d8b2cace4e7a3 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> @@ -25,7 +25,7 @@ aliases {
>         };
>
>         chosen {
> -               stdout-path =3D "serial0";
> +               stdout-path =3D "serial0:115200n8";
>         };
>
>         leds {
>
> base-commit: 4947ee60bf48caddf5caefc08dbbc84d09fbbc6b
> --
> 2.55.0
>
>
