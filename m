Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3981935B12B
	for <spacemit@lists.linux.dev>; Tue, 20 Jan 2026 12:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768911584; cv=pass; b=O39OMEgUz+c+z8OZAi3Q+ajLK5sfYxYCo70CSGbNzmwDgTAQKTHPQgPYNtV1tqywbcHIxfLn1mxaWWbZ6l6W9dCs+gE1STS2hLHUG3DoDufGiKPy1ZMel+jm8jOzz77ayxNvmGZpUtLVuwbPCNF+GDxL9rL/qDnjHG8R+b3j/Zg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768911584; c=relaxed/simple;
	bh=LsiJYu5acxwlmoQ+GMxHNspHmvGoa/T0GCo4wToiK80=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I/TRLOBQUJn1tzFX6FlEeZExQDr20qJwiv/87yc/msH/hz9W9LLH/YVhLi3iicdSJjh93UGcQNHU3OS4aw918pU16JSlc/aTdMtsOTtodeUjDOMKBIz7PYrtAb//TfNTvpkpjFAoms9+CglQUlV/GcgByrgu/u4Lgl5NnI048FY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=13HWzMNx; arc=pass smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="13HWzMNx"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-79414ab1497so885687b3.1
        for <spacemit@lists.linux.dev>; Tue, 20 Jan 2026 04:19:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768911581; cv=none;
        d=google.com; s=arc-20240605;
        b=FTCrjv2P9bGU/BE5ybOvU+cT6wcBhIe7xRKZhuUijAPJbtsmpzgQkSTLbOrv8/mUEC
         lGUDB7R3N11r5YNh1pYZNM28ihAz7WO59dafVNrIyspCpf+GanDRcpZ+ZSZfZKKuK5dK
         CI/uSnrup3UySkuPqyWh5YKhOPSLQWbe8oyGwsrJ4kIX2E9aiosggdVSiA+6w/r/yv//
         5GH//DbvknyMp85iDqeSMYBJUhbxgvnyzsNId9wbma1pgGnm/ScnNc2X6+8S8lEv+hhb
         goO3SJXmZ/UraK4/EDYrm+TXyP4RtoijqajqWyvY2j84bJzMcqpgzFCxHntOAFC19qU7
         U/oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hXaB+rRblVbZQvSIZXsi1b0KhXGaFyJ7cF5b57eRTUc=;
        fh=ERV6TwcU9nyJb8OfYFFGbYeOQ5IQr9zJl27vw3X7AuQ=;
        b=KYD33dKwuhwRpJvgAt2Saxcq+EAYaxxmGHZYpWyNE603TfjwKtH1kxjiVl0ivbCr44
         K/TZDmw60phTTK4Y2V8zBBvALmG7hADiSRSl01yk+jNboTfBwGE0MQD8nLEw+klMZak8
         8rwEEJQHZoPeXyVjKXzFcz8s6mAxYR1UPrBhr30scQr3tZEXOUcSv0la227MnYT03brH
         f0Z+EItgt3NIKXsEcnr3m9M07TT00+yb++QbXJ/aFHc77OXtcX0BqQDTuhTVydSJyQfG
         UB4SdTJUn6Ji6wmw6mkPkc3m4c+mZ7MYcKALrp4+ACUD3KyyJzCFOEggE/JRgCQP1/GS
         Ohvw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768911581; x=1769516381; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hXaB+rRblVbZQvSIZXsi1b0KhXGaFyJ7cF5b57eRTUc=;
        b=13HWzMNxV5oaEc46zR0Kh+XQVzxux6yci9FNIJGUycn33Eq56vzZKQJQb0X22AU9Uc
         /y027WqeJuPZvq2xZfllzDozOoXcdiUsZfRYPt+mCItXYtipXs5uTlxXvx1UTSA86ql1
         3vaZN1DLNLQzsmUtM0D/bjs1/z+RBsq09VeJRmnNnVj2YFT+a/l8L8Tg89pJJz6FPqHc
         DMZaxV/+UK4p5hRyVOfDs0hnL3Qm0kEKKVFmYoQ4eOcmGIJHfjmpo1t9nrFnxx7i0ovV
         E2bX6+kOXlvjYof3oVkEUJc/nDXxvDY9eLq5fAmZBFyhd4ZPkxl6FzoKLDJNNxV8blrb
         WmzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768911581; x=1769516381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hXaB+rRblVbZQvSIZXsi1b0KhXGaFyJ7cF5b57eRTUc=;
        b=wu5tuqXBQNTP449ejuQiKd+vS8nol8+erqHf1Va1Me0b7Hj8vAGoPs0WTdNyC6FkMf
         8bNKTXoVPnN4obT/5ze+4su8Hcp6Ivec47RQwR0lq+3ArSsr1IESdDaVB4L9q43EtOzE
         H9135g3A7/mW7gUvsCCqWn9Qaky64CmaHNAW5qs7rcMNm3cnNhOi163Fkw9L4hxZjj3M
         EQqWVG8ui6txZW9OTsN5y4hQU4t3JawcqD8rfLQVMatwB92b08X8rkZOwS01b1+R73BT
         lsyXaZ4Rj6RtqeHTdqwGi3b6pSErpteuxKazlvVBCAGRiWzRNtGc7TWG2u+MFdqmwHpH
         IVWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGBQJoNRfO2+X72XNyvie1RjkfC5j4kCCAFoX/byiruOb7dk/cjbgzuspKr4OeXy+Vih3X+lzyPA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxfc0sP6qr5QpJp04GxTi8Un7//znr/LBq48Lp6W1mscX3IvSIK
	zZgOSoky5moDAP8MlLHdMzbdOh2nGECJu0F4ISf5sPkDH5Tnwy85w2XoQUspI76QlR5FD5rKpVY
	xd30mGY3+OSrzJ2npYT74HJklzL3xyLcp7/RnjuWKmg==
X-Gm-Gg: AZuq6aLdATOroIwMXdeyleqNykNFDZqL326Zzt1qdSDAklf0+j39XE6H0Wm5E0FDDcy
	ZmVolzR1hz/6PCIJwppITNw6Hhk3qIGa7L/sPPWc4zDcWWluyJ1qxEXrOX6012cwRKXeJhLWnyi
	zWaKWA8WN6XUu2x7g4tUN/y5Ise/v7rx7pDt5nRtOPBEw9FW5Mzxg+smjjaRJ9QHgB7UlKCodts
	HiGljFda14Sr4Nj5d0QL9++VzIUquHWQO7Gey/m8hs9g9W3T+rTbQDFkUDAaPF2xMnBIvyvLUjh
	+ru91XT9fisRU+MlYCvBmzmt4r4gJEaozx1YoCrYa6DAiWnRy+PWCCQ=
X-Received: by 2002:a05:690c:dc3:b0:783:6f68:2a05 with SMTP id
 00721157ae682-793c5262618mr117640327b3.14.1768911581006; Tue, 20 Jan 2026
 04:19:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260120-k3-reset-v3-0-effe87f4bdbe@riscstar.com>
In-Reply-To: <20260120-k3-reset-v3-0-effe87f4bdbe@riscstar.com>
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 20 Jan 2026 20:19:29 +0800
X-Gm-Features: AZwV_QgnDKIFyIp77S13MLZLNCHgwh0zxvlAvzBrnx4VVxVC0QrI7vSOpSwulKc
Message-ID: <CAH1PCMaewGAC4J-w76Sz1L838BHO3Zz4-E47vq02cwASkz2wkg@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] reset: spacemit: Add support for SpacemiT K3 SoC
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Haylen Chu <heylenay@4d2.org>
Cc: Alex Elder <elder@riscstar.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 20, 2026 at 7:11=E2=80=AFPM Guodong Xu <guodong@riscstar.com> w=
rote:
>
> This series adds support for the reset controller found on the SpacemiT
> K3 SoC.
>
> The clock driver changes, which defined new auxiliary device name
> patterns for reset on K1 and K3, have been applied to the clock tree.
> To facilitate merging, Yixun Lan has created an immutable tag
> (spacemit-clkrst-v6.20-3) within his pull request to the clock
> subsystem [1]. Hence, the dependencies mentioned in v2 have now

Apologies, I noticed the link [1] referenced was incorrect. Fixed below.

> been deblocked, making the reset driver ready to be applied, if it
> gets approval from review.
>
> In this version (v3), the entire series has been rebased and tested
> on top of the linux-next tag: next-20260119.
>
> General informaiton about the series:
>
> The K3 reset controller shares the same architecture as the K1. To
> facilitate support for both and future SoCs, the existing K1 reset
> driver is refactored with the following changes:
>
> 1. The existing K1 driver is moved to a dedicated 'drivers/reset/spacemit=
/'
>    directory.
> 2. Common reset operations are extracted into reset-spacemit-common.{c,h}
>
> The K3 driver is implemented using this common infrastructure.
>
> Link: https://lore.kernel.org/linux-clk/20260114060410.3340540-1-yixun.la=
n@gmail.com/ [1]

Please use this link for the immutable tag reference instead:
Link: https://lore.kernel.org/spacemit/20260114092742-GYC7933267@gentoo.org=
/ [1]

The code remains unchanged.

Best regards,
Guodong Xu

>
> Changes in v3:
>  - Updated dependency status and base information.
>  - Patch 1:
>      Add Acked-by from Krzysztof and Alex.
>  - Patch 2:
>      Removed trailing blank line from Makefile.
>  - Patch 1/2/3/4:
>      Add Acked-by / Reviewed-by from Alex Elder.
>
> - Link to v2: https://lore.kernel.org/r/20260108-k3-reset-v2-0-457df235ef=
e9@riscstar.com
>
> Changes in v2:
>  - Patch 1:
>      Update the commit message to explain the why.
>      Update the spacemit,k1-syscon.yaml to point to k3 reset IDs
>      header file.
>  - Patch 3:
>      Use dev->driver->owner for the reset controller owner instead of
>      THIS_MODULE to fix the module reference counting issue pointed out
>      by Krzysztof Kozlowski.
>  - Patch 3 and 4:
>      Update the K1_AUX_DEV_ID and K3_AUX_DEV_ID macros to a simpler but d=
irect
>      form, one benefit is to improve the code readability. More discussio=
n
>      can be found in Link [4].
> Link to v1: https://lore.kernel.org/r/20251229-k3-reset-v1-0-eda0747bded3=
@riscstar.com
>
> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> ---
> Guodong Xu (4):
>       dt-bindings: soc: spacemit: Add K3 reset support and IDs
>       reset: Create subdirectory for SpacemiT drivers
>       reset: spacemit: Extract common K1 reset code
>       reset: spacemit: Add SpacemiT K3 reset driver
>
>  .../bindings/soc/spacemit/spacemit,k1-syscon.yaml  |   8 +-
>  drivers/reset/Kconfig                              |  12 +-
>  drivers/reset/Makefile                             |   2 +-
>  drivers/reset/spacemit/Kconfig                     |  36 ++++
>  drivers/reset/spacemit/Makefile                    |   5 +
>  drivers/reset/spacemit/reset-spacemit-common.c     |  77 +++++++
>  drivers/reset/spacemit/reset-spacemit-common.h     |  42 ++++
>  .../reset-spacemit-k1.c}                           | 107 +---------
>  drivers/reset/spacemit/reset-spacemit-k3.c         | 233 +++++++++++++++=
++++++
>  include/dt-bindings/reset/spacemit,k3-resets.h     | 171 +++++++++++++++
>  10 files changed, 583 insertions(+), 110 deletions(-)
> ---
> base-commit: 6ada99659c6d6a0cde83e6c0f4ed0ef0ba1867e1
> change-id: 20251229-k3-reset-8d9b751ef391
>
> Best regards,
> --
> Guodong Xu <guodong@riscstar.com>
>
