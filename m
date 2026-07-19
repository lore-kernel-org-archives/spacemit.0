Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B7935959
	for <spacemit@lists.linux.dev>; Sun, 19 Jul 2026 19:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784490328; cv=pass; b=gn4W7F3spLA7zjrvXp1JWrsSvp+bOc17YxrNjhjez7w7A8o7qmKcwg43kteESF3u//L7SaP8XN+jFAaiIeLcGdxNDM23aH73SRqZVJarhRNfNNRgT4JI3JieiKYzxn8tM14dmfyLJUPccUclJ0ozON17Ne4VHqS3/GTvpKlgUoo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784490328; c=relaxed/simple;
	bh=hzqj8ZBKZ29Yi7PqswJvk51me6CG0de6kNBgJ9WQj6Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OjCQ6knMvMOiXy/D2AQRD5eyOBWBHD6rEcS1VxAvygM/vqBvM1QkT0ePo35xHBlx4rAJC9tDBYGz0rOs9oqPLsVsqRnxA3tjIhgUJ2lcb4+/3J0dit8P9Ja8dtFjpFAkaGnOyciIcgF8s/qpVTpk6Ha6ohqOETWoGMp9fax0kfw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=L2RydeKj; arc=pass smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="L2RydeKj"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-667ef69424bso7676801d50.2
        for <spacemit@lists.linux.dev>; Sun, 19 Jul 2026 12:45:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784490326; cv=none;
        d=google.com; s=arc-20260327;
        b=AiUvdixEfJhOCXMIHiA03pgzJe2wL8unQAPmOo1i/Qc3hOlMcOGqsjKg/wDqq2DN1R
         FoiHO3v54b8meKSTzi0uSQj5kx9H7kSyHsG1gXs5+3a9EaquzmYbxDUGY+nLNP3slowH
         xQL8f+Pl+EDnZMB233cxjeMbOni6ASZKUoKlH4pwjvgvo87r4evCJboJwwhmEtf+KzlI
         hdg/zPH11aq9Yc1rQy1trT+4FlnmKysP+epEbHgvwWFmr2wY3q353DLC+dzbZN2L7T/4
         jredv3im8gfpVX0HzCqlCkBakjdoYM3igP53ki1sTdSnVL7OA8mAy12Qj+crocxibY4t
         4kdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kCW/8p9Fn7t72z7ayiDXwy9RgjgcbYwz48bHsjcjcIw=;
        fh=/LUtVJrCfDQLAECiFdCKd4sxAvJDJtTUFU4Lpzw4sfI=;
        b=Ci7JWAOLxx3ZoaqecM2SLBs8Ut0IrpwiBrjQxt7roDiRlpYQ4RSopm7LJbqNljh1cE
         z2pZ+pgFhNbC2G21uJUeY1GWWzXsVZXbW9q/GXTRQ29YZbum+OE8dPYD8mMVbYj7+e1H
         IBY6yEeLmc725+kR/4T7GFu99Tx5CLJDbE5GjYaJw0mk8uiGA6Q/PSFgAWSkitzU9Ts9
         GBj9K9hfYzcVjUULGsmO4gFqoeLAJHVsUgR21or/LUJGyD6Cf/SQ2ePjLRGGMhrKeHQz
         3dyr4Ka8AMSoYFZuBkADv9O+ous0QCD63exadIrrLsR3q04nnYBekqFMYAse5ChePQk7
         8SKQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1784490326; x=1785095126; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kCW/8p9Fn7t72z7ayiDXwy9RgjgcbYwz48bHsjcjcIw=;
        b=L2RydeKjZWkFEUblkteT95+Mcy1RB3MtgBd9XBuLD8Ndc+i1SfJu9rTDmXgWknEsbc
         0PmtvxIse/gwI/yB0pbbVhuSb/ebX5CxwybLydPzHMzfDtWg2zKbk1EtYxNKKIvrtIV8
         1YpbzmyMoF3ocnMilMpGXiTBzBOZJ5DOpEQNREqua5QgEuCjW4eVEglh9lVtpKEbSHHk
         vQMn6iCIS9tWkx5S/dFHbVtZvTfK7PLmnFYQ0GuK02xkkQjr23Yo2IBTVQmbssWpTGfi
         /ngVRtqUfPO1FUwQQ+j0R+qCRzTHJQv9ntMsgvzvSaeKOuvcZ5I6jE8QDY415Kpp19bE
         OtPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784490326; x=1785095126;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kCW/8p9Fn7t72z7ayiDXwy9RgjgcbYwz48bHsjcjcIw=;
        b=PDu9Uv2LXcfzV7xiRhv0g89ADC09gxpo8nccv19HivrEACGlGH+yR/I84/lpz1YlD1
         jQeUbG44OQAaQzWJbC8TGcV/dGLAJ0C7rLobxFyYC7IuMsFXE1Ad7MkNMwATzBfxa9wE
         +ppGvyrn9xf19RkRKlVQyPj1u8uZnifenbwOVfOJ1ktdWr9U4sUJmKHOdu7VrKjKfaxp
         QfE/Jd80kg5TgOvr/RiioqZk1LykMNjKX0bgwC35OJE6UbO3uBrzYa+QqOCgAY0H+ztY
         FJMgd+vvW2VSOQxxi1fSLDGlo30GnAvU3cAT78frBxNf/ZM/6CrSgjp9DMnVP0QogIIO
         UAGQ==
X-Forwarded-Encrypted: i=1; AHgh+RpRiE0CzmmA5JJzK9GYEIn4u54UoM5FCmUZ50OCCjwcw/pbTDeTOIT1uxCdJgDRPS/9wrXeeNho6A==@lists.linux.dev
X-Gm-Message-State: AOJu0YymHLuuIUDlkmkd7bmTlY/aj2yD1oXRn6J8BrEkVXpGGeAoecpT
	AvzrAFvijKy95FFmuDW37zxuEeyiQgNSYQdhuggRzPSRvaHmil1uCv1GlQ+yzczESykglm5B0mX
	/Egq8XbJXYlNFuIqJXpm/j1Ty1Q7PgTdA/bNVv4zObw==
X-Gm-Gg: AfdE7cmYRFTs/4TOMXLPnWJqa7uE8erLmu2sYKYDgl+DZUH7CUIETvNq+9mEVWjuiCr
	CFmGuLL+RU4mOxocpKwGsroMIxD44DAJv5nsmMVOQiMvZcrzUjgu09Lpp9mOpeuZHBbC5IRtq9L
	iSeTgnS5ChoUnXzn+iKeH12nF4uSYvaimXKbGK//BBfxKDMQEP9NT4y9e+sPBZNo5ewEGgb7CiZ
	CkfxYKfq/DmjjzSZ/VdACD44s8uHgh3s4AYZlx7Xv2dNRhglyvasZAATetHUz682qiet6mMeSNn
	BZKUF+d1ARD1Mo+1ow/rk4HdndrfRkeYQ7SC7jwtVO6HZcw=
X-Received: by 2002:a53:acc7:0:10b0:667:bb60:78a5 with SMTP id
 956f58d0204a3-6683bce8a39mr2368237d50.52.1784490325858; Sun, 19 Jul 2026
 12:45:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260716213314.3027969-1-aurelien@aurel32.net>
In-Reply-To: <20260716213314.3027969-1-aurelien@aurel32.net>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Sun, 19 Jul 2026 14:45:13 -0500
X-Gm-Features: AUfX_mxEqgyZYEKypyXx4gej1zq8pkt4w3TINWsQX9aT6B0qN1Sg9IzP2i44kqE
Message-ID: <CAEev2e8M7hDz+d7Kb9r2crA3_5roKhgVEf3kCsZCfLXQj8g+xg@mail.gmail.com>
Subject: Re: [PATCH 0/4] Enable Bluetooth and WiFi rfkill on K3 Pico ITX
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
	"open list:RISC-V ARCHITECTURE:Keyword:riscv" <linux-riscv@lists.infradead.org>, 
	"open list:RISC-V SPACEMIT SoC Support:Keyword:spacemit" <spacemit@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 16, 2026 at 4:33=E2=80=AFPM Aurelien Jarno <aurelien@aurel32.ne=
t> wrote:
>
> This patchset enables Bluetooth through USB on the K3 Pico ITX board and =
adds the
> rfkill nodes for Bluetooth and WiFi so that the devices can be activated.
>
> Note that the patch 4 is only useful with the following patch series:
> - https://lore.kernel.org/spacemit/20260709040027.958400-1-inochiama@gmai=
l.com/
> - https://lore.kernel.org/spacemit/20260703021024.495433-1-inochiama@gmai=
l.com/
> - https://lore.kernel.org/spacemit/20260709040415.977784-1-inochiama@gmai=
l.com/
> - https://lore.kernel.org/spacemit/20260715-rtw89-spacemit-k3-v1-0-e577bc=
63706b@oss.tenstorrent.com/
>
> Aurelien Jarno (4):
>   riscv: defconfig: enable RFKILL and RFKILL_GPIO
>   riscv: dts: spacemit: k3: add rfkill node for Bluetooth on Pico-ITX
>     board
>   riscv: dts: spacemit: k3: add USB3 B and C controllers for Pico-ITX
>     board
>   riscv: dts: spacemit: k3: add rfkill node for WLAN on Pico-ITX board
>
>  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 32 ++++++++++
>  arch/riscv/boot/dts/spacemit/k3.dtsi         | 65 ++++++++++++++++++++
>  arch/riscv/configs/defconfig                 |  2 +
>  3 files changed, 99 insertions(+)

Tested-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>

>
> --
> 2.53.0
>
