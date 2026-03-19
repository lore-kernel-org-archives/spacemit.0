Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4013C2781
	for <spacemit@lists.linux.dev>; Thu, 19 Mar 2026 10:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773917090; cv=pass; b=oQzI43nvdkpYv7wDVTStIEyVSUY+HkR6KefTlKG+onz3YCubq3Kr/F1QuaZ1FmsXaff4GmbeX/mf5o3+kLOJRCA7oFkxNl7bGD531nrydKyKBbP7sycdw1Z9ocmpcljPdkhbNmdFmlLrfblCjflhdLEsLLuDqe+piKr3CYYDR90=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773917090; c=relaxed/simple;
	bh=EiYofbmwlMfzv/ArY5NjYo10OUgrpmbug4B8jl033qM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H2wHCrk4TQpsPE8rNqR5AwfToZ+UXEcnlYgv4xlik8h9wpEXoWOZJhSahnQ1oS865I+kpxh7REeOGwU5Zrv8grB12qxDg+e4o4qicuqLqEQ/C/6rUfMowKpDv4kYlqqmFjYTIv5k3l6exfXP6yee97joV5/QcNaRNEhVzGh+H2Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OUE4M3DO; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OUE4M3DO"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-665634cb208so1523867a12.3
        for <spacemit@lists.linux.dev>; Thu, 19 Mar 2026 03:44:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773917088; cv=none;
        d=google.com; s=arc-20240605;
        b=HfzPYWEkmi/ABgZOFPkD5nRxfWruWgxwS1h/jxgX34K0sqLbSNqmRfXIewG5ulNPM4
         I7rDGwLHVfkRS3Py9KBBfRlTePNfynw5rXcG2NIOTwnVUrvjgPq7YyN1LdM1GlpLxHnM
         2My/nw9o3hsAMfobC43X/cd4Q4d5MQRhzbejHYoeTT5LpRk/nQQNW53v8DHYwnHifG80
         +q8SRQ395WG2rrUU0vs/xsoWGFmJSvxqbHQ42431P64Edtqn63EGxg9AzlPiNbXzFeO1
         YmrXymoGYgr2uHCLpqdCPN1ntc+qdCyhp1i+ff7yLqDMkk34XSVBSN22wgu/y/qgvqmy
         V6Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8nsXLrCC8XRALmE6EP9wDlaUdJlORBZ30G/UqxIe1EE=;
        fh=vIiyw8fBJHs9oJ4HDSv+Pe/f0xDXTYDKeetNezfCh4o=;
        b=adcPFImVhjvBcjXO7mIT5KlnTtVeZlakNqTIsQkurSPeUd9xa76x/fs2EHcfuSeooi
         FHHonmilAnH8Cj2bXf392cUW9DbBXSMvZI97Gu7uMZRHC4lh3K9PiyaAjeDptsL9IkIr
         6yzMsY4vBDrBveCqHxu3VPtbUrIy+imTOBykj0rXa6II7RsWII3eLnACTeA1DbftcZgA
         Q3MjxOgvu3sRLALDfnGZ+I6km3nAL4umPdX47zP70Bl9dHyrVo/6olN6fIhcOC/jff4B
         YxH8D3cswROUJKbO8t5dMRGcqjaT1PP10l6dandZjPw4cbE45WtnKsVbFFIPDUtvkDY+
         SQfQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773917088; x=1774521888; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8nsXLrCC8XRALmE6EP9wDlaUdJlORBZ30G/UqxIe1EE=;
        b=OUE4M3DORdTu9VdRAELKWn1W3ChKdrb9fLezsY0W4PBqRZD6LW/gFyp6FiDtU+8LjV
         5Jt/YjyQ3etpazkqnprciWVbMs7SseX1LmwvXl3On6RaKYuxf0v2u5HFQDzS8YFnLHLU
         C9z4mR+0u5qN+OGEL/EX1u7Lmh2at+6u2LHllNCETimHi1wLnlu8qg/TIvzRr3mC9Xbs
         U4whQi26xRsHiyEHu+Kx9pkV7cWGNFzjm/3Ai9fNPGnmmRRroi1nuO97sQ33pFMeYMie
         vbD/x0agQOYIEQuTOPRlyMTJlPN6fgqssEjnulgpQlttLIILQAluIIWYBbED/Oo6AvNg
         mOvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773917088; x=1774521888;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8nsXLrCC8XRALmE6EP9wDlaUdJlORBZ30G/UqxIe1EE=;
        b=bJtZc1ofujNjySC6P4XDJzbV4yHDOV4RNpzkaoyvb4RCghskp/JuUC+POiPpoyY///
         8pwbFi92qbQnWAfxOfvtmRZ3qkAmj9GZkzE7TdRrUF/ownc1Sh28c98cfWa+TMsza1AE
         VISuPEOO16bQkYT8MmZKaIwp0IsDS64R3ymj0lxWDa72KkxwJK9qg+NqfVQF7htWATz1
         8nSWsx9nyyAXVjYR4PIZPaTW59WgbrhCNX7GAxIiFziQcCK7Ang/ZTrhsE/HGBNQQerG
         t6t/CyayPBlU7uEq4EkcgMNBXsdeqajC7S4jVvkruNW1A4WMUwJwdIjtJgT/HMlxAmIB
         QV5g==
X-Forwarded-Encrypted: i=1; AJvYcCVyX6FmxylxJIk+J+zp5xH2FL0jhNT/SqvkEhi25lPmPRLADgAUkRAxoe8r0NdudOG5+AaUNo/oGw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwaCAxTrJ0U11dtElXRw8Kow85RopSqYCgHl1qk3keFcYeNgdDd
	47OAjRtVTLkxKiwqP2CvdDBwgiMzTLuW1EYD7nO4xzY5oBXnsHfqQsfgYpEJNVmvEpy2qxv5Fbm
	YDfEEBIYSsQoeLkxoaLDFGFiTy+xzsds=
X-Gm-Gg: ATEYQzy12eZwN3i6j2pNdXPw73UtVA+v7VmeJ6slVT3QYjmhWXY2u5YtJB3/bWEEmI+
	oXVN2dqOD77lxr1sAWoBb4lPMUqBSxSZXmhvoX0AmaTBA/hs5sfAa+Bxaoo9cYdWJPvqYO5eA+n
	DgFAjQ/lD/RZZ6vKVr9LZMpPIjJ0WwXQR6ffU701sgVv4HPAxIEu2kI/HXFc1nw0hgmjCAyAGfu
	Uebf5sg/MTMtrOb00WiStHd88jeollMNxhPD9k6YsH3IWtYNhjKi6pZuCJL1Kpy0sToPm0DShAF
	BnuTEA==
X-Received: by 2002:aa7:ca56:0:b0:667:ddf7:7d9d with SMTP id
 4fb4d7f45d1cf-667ddf7835fmr2510617a12.10.1773917087638; Thu, 19 Mar 2026
 03:44:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251127-b4-k1-thermal-v1-0-f32ce47b1aba@163.com>
In-Reply-To: <20251127-b4-k1-thermal-v1-0-f32ce47b1aba@163.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 19 Mar 2026 16:14:30 +0530
X-Gm-Features: AaiRm52C7IQCXAwHh87UFE9OwrOumGbtL8uwoXCOsBJxz_0fqoGXY7qT2wiZr5Q
Message-ID: <CANAwSgTp6urWYT9H96XR7viKv7Sy16L4exS2KR5PLq_FJ91xbQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] thermal: spacemit: Add support for SpacemiT K1 SoC
 thermal sensor
To: Shuwei Wu <shuweiwoo@163.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Shuwei,

On Wed, 26 Nov 2025 at 17:27, Shuwei Wu <shuweiwoo@163.com> wrote:
>
> Introduce support for the on-die thermal sensor unit (TSU)
> found on the SpacemiT K1 SoC.
>
> Include the device tree binding documentation in YAML format, the
> thermal sensor driver implementation, and the device tree changes to
> enable the sensor on K1 SoC.
>
> Test logs:
> Hardware: OrangePi-RV2 integrates SpacemiT K1 SoC
> Kernel: 6.18.0-rc4 mainline
>
> Verified that all five thermal sensors are registered and reporting
> valid temperatures.
>
> $ cat /sys/class/thermal/thermal_zone*/type
> soc-thermal
> package-thermal
> gpu-thermal
> cluster0-thermal
> cluster1-thermal
>
> $ cat /sys/class/thermal/thermal_zone3/temp
> 28000
>
> Dynamic threshold and interrupt tests passed via sysfs trip_point
> manipulation.
>
> ---
> Shuwei Wu (3):
>       dt-bindings: thermal: Add SpacemiT K1 thermal sensor
>       thermal: K1: Add driver for K1 SoC thermal sensor
>       riscv: dts: spacemit: Add thermal sensor for K1 SoC
>
>  .../bindings/thermal/spacemit,k1-thermal.yaml      |  76 +++++
>  arch/riscv/boot/dts/spacemit/k1.dtsi               | 101 +++++++
>  drivers/thermal/Kconfig                            |  14 +
>  drivers/thermal/Makefile                           |   1 +
>  drivers/thermal/k1_thermal.c                       | 307 +++++++++++++++++++++
>  5 files changed, 499 insertions(+)
> ---
> base-commit: f5f2e20b1cbc5f9ea20b372d15967b24921ede19
> change-id: 20251124-b4-k1-thermal-eca906e6dd7a
>
> Best regards,

Tested-by: Anand Moon <linux.amoon@gmail.com>

Thanks
-Anand

> --
> Shuwei Wu <shuweiwoo@163.com>
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
