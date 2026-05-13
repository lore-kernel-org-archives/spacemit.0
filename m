Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D01339A4AA
	for <spacemit@lists.linux.dev>; Wed, 13 May 2026 08:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778660665; cv=pass; b=YsqWWA3WFXKmsFkLQGMS2jErii8NtacSMavszvGNEqxM70HCBtLMTVYKodEm+kxn+EC4IZYz3IcyLW7SshZBUAMU7R6gkSyvH6gRDpB32CGo7XVtK3FztuAbimRqI37tKkVY1D680nW7VWmiQegvqIoYiUnpe7C/IIZirKi8HMA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778660665; c=relaxed/simple;
	bh=kw3dfO5olbdQ/dpmQt0wjjo7jSfh7MCCGfQwYXwybf0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mYJ44n3WxyadoSMm1RAlF0kTkwOktaN63EuGvjUbfmd/rUIDgbfSk34MD8hmze67m1OAbx4zZmXzgLYcuW2Quk4NaeYRXAo/qLxDnfDfnPtJ+oBJ5LbEa1xEBQNTLyStRvy/eco2P+xxUelD4+LDFkTtGhzozIvmkp+07OeBLnQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R5wa+rY7; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R5wa+rY7"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-67e24b8ef55so9186461a12.1
        for <spacemit@lists.linux.dev>; Wed, 13 May 2026 01:24:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778660661; cv=none;
        d=google.com; s=arc-20240605;
        b=jp7vHc8HcMnxi5UfpA1jMHeCwCxkKzaISAAuVoO4HEmj3+dxCVSXYwo2EdWz764BuR
         5ZV3+8L/8ls6nU9McvsEQ0nR8rW4tN9tcFZL9+pUy7vvmfyHxRz80J9u7K/nhRghufsN
         1R6MberJYyrwE0Rf9JlXPeqAcDvY8u+jvbYz8PCcdeJarQWAHanI7R06gdyO3piQEsNR
         fmIM594elBXV2/jPFAHoUhKcQws3A8K5q0hSSUFlVzAp2W2lTFdTlcw3eXRP5Wb4e2RV
         O0h0rYhicYMKEriYgcOjV5ccRcm8J5URAgH4GVvtm8r9S8PLGnU5ThjL/LRIo6sU8eLL
         VfnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nYSyg8L9M5z+qBtwq1ZJJwTOzPdHBSzFb44dE30H8ek=;
        fh=+VawA+YBSG71OX0NUV3A79ejm+1wAr0PuZocRqSw7Ow=;
        b=QVSjyZkbsvJ7FKPa06peZFOGp4utS/lxkp43luwiBLpxDoWA4Zyr+HeYirx3wL5Ut8
         fcBs3rG28KED1d9kIxQA+R/PVM07bntUl7M151FdiLNyE+NT8TsImJFowBZrCp071M8p
         P9uWDMtEW2ldQMhu0wh8JZEF3ZNE/UUJjNf9WX5RSTNxejWIhcaNW4PNOWjgi6d17ajD
         QABIO8/j+I8pIUAOAisi7I9UHjSf8FG1pVHYxC0kBHvNhYnCOK0yUVL7A5xkSbgIQuwp
         JrAiY1EglXgweuFI0mAaNolK/yAb8DT/w/ZuafZZrwrYvi08OOjk/FKJN4k+gmeUxwoU
         gL0w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778660661; x=1779265461; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nYSyg8L9M5z+qBtwq1ZJJwTOzPdHBSzFb44dE30H8ek=;
        b=R5wa+rY7S1casge9L6efGir9edtL0O69RyTJfxR4o/17Ekb9gkFJb5mKxBdWfwu2BL
         KjqMgHH0yXCX6bHpLSpcY0cMuXDcImEq40uGy1MI11gQIbrkV0qT2VKX1iPyRUCMyPix
         mX159haZ5ZtZkDyYKoigp756FGzzkfmyIOJ1TdtCYwYRRGVG8DsxaRz5PwJHb25sgaB8
         U9X7bjAUxpLwaa7NrMwPxjuXgboijUksZ6Rrp0JeQDyf7Qgv4YDWxiys+2JEcGq/VIC4
         I2zD6+YJSeSXRmXNmMkz1Ts5q7D8WiX/b57bvzGQUbe4+Dv3Y3gBRy0suSAjUcilZbvj
         jxkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778660661; x=1779265461;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nYSyg8L9M5z+qBtwq1ZJJwTOzPdHBSzFb44dE30H8ek=;
        b=DTLUR4YmpHr+yF3Y8697XRmOLEjXUMydiyCauA1OP3rRAa04ScIQxz1At+jWd5oSOq
         KG7SXPSLCCCw0k/R9utsi8XKUb7x/fV45Kowt1SDNiW1aKqY/nNLomAopwpxQ/aoKofM
         ToRNIVX8INAwhev1BtT9COGprtao+g8JTdeZudXKVhH+c1F180jz0F00/HYUDBN9V900
         ha/jPzo2uSlzqzXkT1iGlZstSoijUvhUMXRJycXQ2rI2qvbOM587DWKnAg530Vz8FWoo
         S93VAOcZpLMZ99I4urk1I8a7ivcNAng5Osy7zDlg0fV/DUQX6sI8ZqMDF8DTEJFbtOgx
         tSeQ==
X-Forwarded-Encrypted: i=1; AFNElJ9nKaU7MYur+zzfV9Q3R0+yTeenHOpuh3KGo4Glto4gj6BrJfbJJBDBjquFbfogYVSc3cBplOYsvw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwRgbNpYUC9shpYrcDDQP7pxaQsx+1O+KXtn60H8esit5by8qXU
	3d7DIbveUvTATP9v/mbr445GIAoe8pG28+yRd78blSmw7qeB6PGKjpgnm7IOVIzO22Ts9HOMcqo
	gdF7ytefUrZp/Tikow9rYyFtamNM3lrA=
X-Gm-Gg: Acq92OGcO1yOHnaqrbEQI2KxHKtrqKgPV+I735DC1f9l+M9Vh2JwwSIzBKM2xNULPZm
	S8LUztsx/CZPOkIvTqnkIhXfuH0kjD2ekPzriSnH52ylU0nSat7iCATRmaJMraxEwfmrvHYNKlt
	xZ0rjBCX5jXoAOeR0x/k6baNE9NgZOFiD5sWtofSL3e1yTL8CHwrronajfA+Tz1CgObnoBrBOZn
	2mQQbag87f3zBWfcdhjCmk1zaHuATL9HcOclCcD4reeLr3y9JpuUUBqr/VNasoSkPT7f8n5c5CT
	Q6ilWA==
X-Received: by 2002:a05:6402:3112:b0:680:c7b7:25bf with SMTP id
 4fb4d7f45d1cf-682558f0800mr886488a12.6.1778660661158; Wed, 13 May 2026
 01:24:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260513-k1-pcie-fix-supply-v1-1-4eecbdd44ebe@kernel.org>
In-Reply-To: <20260513-k1-pcie-fix-supply-v1-1-4eecbdd44ebe@kernel.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 13 May 2026 13:54:05 +0530
X-Gm-Features: AVHnY4LhB6N7LiGPVl7TNwMFIk5YuvTL8zITcPKn8T3qoq1cfBO8XJO_5-DoyFc
Message-ID: <CANAwSgQvGy9LMmHczxUSYDAq+fCFHctR=wbNr1=f+sLTts-9uA@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: spacemit: drop unnecessary power supply from PCIe
To: Yixun Lan <dlan@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Chukun Pan <amadeus@jmu.edu.cn>, Andre Heider <a.heider@gmail.com>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Yixun,

On Wed, 13 May 2026 at 09:06, Yixun Lan <dlan@kernel.org> wrote:
>
> The PCIe Root Complex found on the SpacemiT K1 SoC does not require
> external power supply, this match with the dt-binding documentation[1],
> Instead it's the sub node of PCIe ports which should add vpcie3v3 power
> supply. So, explicitly remove "vpcie3v3-supply" property from the PCIe
> controller.
>
> Link: https://lore.kernel.org/all/20251113214540.2623070-4-elder@riscstar.com/ [1]
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
> The problem was introduced at the time of PCIe DTS first committed to
> kernel, the vpcie3v3-supply should be added to PCIe ports instead of PCIe
> RC node.
>
> Refer the example dts of Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
>
> I'm not adding the Fixes tag, as this doesn't cause any severe bug, thus
> not necessary to do the back port..

The vpcie3v3-supply is required for PCIe operation.

However, according to the device tree binding, vpcie3v3-supply is defined
as a required property of the PHY. To align with this binding, the supply should
be moved to the PHY node, and the PHY driver should be updated to handle
enabling and disabling of vpcie3v3-supply.

Thanks
-Anand
> ---
>  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts   | 2 --
>  arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts | 2 --
>  2 files changed, 4 deletions(-)
>
> diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> index e20daa50a152..c70081856606 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> @@ -316,7 +316,6 @@ &pcie1_port {
>  };
>
>  &pcie1 {
> -       vpcie3v3-supply = <&pcie_vcc_3v3>;
>         status = "okay";
>  };
>
> @@ -332,7 +331,6 @@ &pcie2_port {
>  };
>
>  &pcie2 {
> -       vpcie3v3-supply = <&pcie_vcc_3v3>;
>         status = "okay";
>  };
>
> diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
> index afaad59e6bce..7e5915023eaa 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
> @@ -313,7 +313,6 @@ &pcie1_port {
>  };
>
>  &pcie1 {
> -       vpcie3v3-supply = <&pcie_vcc_3v3>;
>         status = "okay";
>  };
>
> @@ -329,7 +328,6 @@ &pcie2_port {
>  };
>
>  &pcie2 {
> -       vpcie3v3-supply = <&pcie_vcc_3v3>;
>         status = "okay";
>  };
>
>
> ---
> base-commit: f068b204555ad62d6a841a49feb4ea8c4f45b25c
> change-id: 20260512-k1-pcie-fix-supply-d12f6d50d8d4
>
> Best regards,
> --
> Yixun Lan <dlan@kernel.org>
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
