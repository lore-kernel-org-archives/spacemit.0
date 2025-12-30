Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077272882D3
	for <spacemit@lists.linux.dev>; Tue, 30 Dec 2025 15:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767108849; cv=none; b=fJ7onwS22f6O3gB9b6RNDOEQbrw0hsfWHmEVZH2P1QjOr18z6DgjKx8Lpe9sACFIWIOvJk8nPClfHL0HEMQ22fdPZ9u9iTFH/LuoHukLWTdQg0yPILmVT+WbmLxyK5FDR/431gTZDxX9EhGSIsB8JtkZ2oQLvUuiG/Ad/FU5Fjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767108849; c=relaxed/simple;
	bh=cJNaMYuuC2I7/+95x8jcQiPUFjMk3F+7PHyjW8Lo1tg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GJxVHblfsojvuLvoKfITj4uE/93Qa+YfrfA28boVXnZhbu7wgZAD0r1FnwaAQMiL3sWbLV8Ta8RE67wfykQBk9gIU44Q3rBRltXergQJvepnD0xO8kbYaqtho5X9z12CCD3FUyotkyxWrMFCNWuYrmVsJTd7w8mhYHssy5Y1PZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X1ZpWQvf; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X1ZpWQvf"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-37ba5af5951so91832801fa.1
        for <spacemit@lists.linux.dev>; Tue, 30 Dec 2025 07:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767108843; x=1767713643; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IIQJu7CyiY9gIZvx6eWahf0Uexh2lGW7onsdB+Wi7IY=;
        b=X1ZpWQvf7jfibAv8Vo7vCtvbgX3pin2JpLYlejzMLj8duwaIKG02ZfGkeyRktKV4OJ
         UVqLs8rPbvFr6RvYCm6lQF8q1zbloSpW0f+z9EJl+WWvLQbnAYkZdtnbn+O+SLRwxqyV
         RkweCbYeypBjDc97VpUAZHAYcwWJrpuzX7EKj73eD5+crC0gqHFhUd+w0o1TbXxfFVks
         tSM1EQPocPsq9Mk1tibwQJr4qYZmT/62N6W3f7XRDWqd1ehi5Rwd+eARUdojoL6YSPLA
         kuI/oY7IVCDyAhHulRiRMbxfhWNYiHBXyb4/38np7MJ7fM4vdLFBKIbozGI8Qhq65r2z
         6DHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767108843; x=1767713643;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IIQJu7CyiY9gIZvx6eWahf0Uexh2lGW7onsdB+Wi7IY=;
        b=c/bsKsXwQIJw+R/Nv7nxPYS9bSdguq8vQqe0TBUv/RzoztTtX+Ui8ezwMU1vVW+eDX
         sRE6YdtZfw9f0Sd9uSg78w4mRpPA/mhUtPNSE1qxQK4FKr9qhB4gVhNHJ0v05VuPbZqr
         r/Hr8B4qe3d/H/NmMqzB0LQJ6irFoyyfcdULDwfnY62DpAHPGKGFNOtRWns0V2xABnKR
         EN5U7WG3ei5huDfDEdXLuEwn1z61KN1ZAcld1VDFPTtYOC5eV8/jXsxwNpwnhEcvH+BH
         bknOqlW8TlvF64sRK5aQbuAWLWMKOetGRJbMTEngZ8OtBcYzmfwntA49DyGhS12Id3za
         JCgg==
X-Forwarded-Encrypted: i=1; AJvYcCUvPrq91wBmydL15tVFj1Oxb9LtOXIUsG5sHjw+0fEOujNkfBP11/FxqE9lHUiNgafZvYikBL4DPw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzQ2rpYh2yUgqTSFuGXFnactK/rkIrNGexoUNp0EENHHMKiS3cV
	Kex9cJl+lWVK3h8MrtJ5OMc7xxW9oHOZ/C5BEWNR0SbP1+ovGpR1POMuNGpjdunSEF4Qm6n3Kx0
	1aV4RmnLYU0gO59mL71oZ6cfwE0FvDL8Rv9vW6ulW2Q==
X-Gm-Gg: AY/fxX6NR4sG9dOKVxKe07liWyZHGW/UVl7kEUeCQH2CHWHFVPwFpQmRUCc/ni03/nH
	lSVIJ1r2/fcuvewIgkOoToND0ba8FkS7Jdl1aGu7Hm7zV1Fshdm780wXTJQcsUwFbmlitGsmrXL
	9PxcAiUC7Uik22yck6SwxtMjA+hanxZjPiJ1l0umAHRuYMecvun1DD3u6FeUlhcK/UuT5Qpt5Lg
	QUHdbdPHd2YnpQSCTE1SNvySSku1lv9FJKQjHSnlUtzPRDdcKSh6VSag68DuFh54m5ZEBgq3hoU
	R+TfOH0=
X-Google-Smtp-Source: AGHT+IEEzSWxU0Fr9jtKf4rnUE+MZIqWiBIfHx6EwjCFpsAYl5LLEX7BferoDb537v/2XTB1q5TRJQn0YC6nmgiVvgg=
X-Received: by 2002:a2e:ab89:0:b0:37a:3033:16f6 with SMTP id
 38308e7fff4ca-3812164513emr98831031fa.35.1767108842896; Tue, 30 Dec 2025
 07:34:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251223-07-k1-sdhci-reset-v2-0-5b8248cfc522@gentoo.org>
In-Reply-To: <20251223-07-k1-sdhci-reset-v2-0-5b8248cfc522@gentoo.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 30 Dec 2025 16:33:27 +0100
X-Gm-Features: AQt7F2oqCrEKFHiJvi35sI497oUVGoB1FksL7aATuRnp8180lObyxwQDc3LztRs
Message-ID: <CAPDyKFo905ptdO-rSkiJ-ax2u=P_+EAJA30b14n=B4j9adaaKg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] mmc: sdhci-of-k1: add reset support
To: Yixun Lan <dlan@gentoo.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Iker Pedrosa <ikerpedrosam@gmail.com>, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 23 Dec 2025 at 03:25, Yixun Lan <dlan@gentoo.org> wrote:
>
> This series try to add reset support explicitly to SpacemiT SDHCI controller.
> Previous it works well for eMMC due to it's already initialized at brom or
> bootloader phase.
>   The controller has two reset lines, one connect to AXI bus which shared by
> all controllers, while another one connect to individual controller separately.
>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
> Changes in v2:
> - To not break DT ABI, make the reset line request optional
> - Use devm_reset_control_get_optional() api
> - Link to v1: https://lore.kernel.org/r/20251221-07-k1-sdhci-reset-v1-0-6780af7fa6e7@gentoo.org
>
> ---
> Yixun Lan (3):
>       dt-bindings: mmc: spacemit,sdhci: add reset support
>       mmc: sdhci-of-k1: add reset support
>       riscv: dts: spacemit: sdhci: add reset support
>
>  .../devicetree/bindings/mmc/spacemit,sdhci.yaml      | 10 ++++++++++
>  arch/riscv/boot/dts/spacemit/k1.dtsi                 |  3 +++
>  drivers/mmc/host/sdhci-of-k1.c                       | 20 ++++++++++++++++++++
>  3 files changed, 33 insertions(+)
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20251221-07-k1-sdhci-reset-1990d1170437
>
> Best regards,
> --
> Yixun Lan
>

Patch 1->2 applied for next, thanks!

Kind regards
Uffe
