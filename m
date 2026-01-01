Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44DA24A046
	for <spacemit@lists.linux.dev>; Thu,  1 Jan 2026 22:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767307808; cv=none; b=kk/SYB3J0uiWv95yrGZXdeF4X29PkdqOyvNmXKWIJqQ2uld+JLxX/SfFGbgrdAYvCaQUolND2wpyGsmpr0NE2s0gRp/81oMybZeCFmZl7G0rcJYH1qCWE57EFNuPAv1Wl3a5PHxcId5xm4X26IhmaPNQtRlVREmSPlbWs2pZZTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767307808; c=relaxed/simple;
	bh=qoQ2LWoUBAb80RcbR+OV8fg8vhcqgnhQ8/NW3hsNVFk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VE4y4vsq4iyMmAjep5mrVxMTDWohuJdeZVSV489a3gVkII9sDCH2Gk5j1mexFS7dU75yRITYVMscn7tk1MYJJQU93+eSsFJifby+ml1MAI8+7IdqDs0a3hua1m1TwdlSJsljODVcuZRsWZLYeJKVTzzuqqo8lY2KlA8SmuP3yUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IYRH+e1x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IYRH+e1x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACBA0C19422
	for <spacemit@lists.linux.dev>; Thu,  1 Jan 2026 22:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767307808;
	bh=qoQ2LWoUBAb80RcbR+OV8fg8vhcqgnhQ8/NW3hsNVFk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IYRH+e1xZasvaKPQTcFF+l7qwCxD82O18aOK/MFql6CMiErq9pPez9MkpXc6fs+PR
	 vNIxJbPUcUpA0nR6mHzduQZbK0nBsS8EPnzFqpzTTKIbt9mlZiQEH+Hub7X/3udWkU
	 c2iC5P3APhxNoYuZmYKzhoJesw2LkcufH62SPxn8naJKYBu4mNUPQyBRvpQIxosjL2
	 i024rcHVvAvioc93SEzzqWXDBXL2NbAQaHbmPRcDkm2R2SJX+1rTz6XdQBb5EuCpXe
	 ky3FzontcHnhpfChURVpedREzdL+herqaKtMtDSlKPzhu+drjrcSJIdAzFjxVXPh2n
	 UWasZDHSCAIeA==
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-6447743ce90so10682353d50.2
        for <spacemit@lists.linux.dev>; Thu, 01 Jan 2026 14:50:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU46oOnyBiDAoI6ofb8JE3KYB/CNbwDC88ZrY8j273Un/T/fUTF+7eORCGu2n/5PNPX5om8jeAQ0Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YxoKQIaZJOmwllb1kBBIw8dLCVV+A86fEF4lhM2+ZglrnCVlgYk
	+iZesH/R/nS36miTx35dtCuGPbdC4d55hxAtLTNMgV3IWRPq+VHLlJCvTNSyvlN+z6bi8PDJk/b
	bVLdWBWsKdAfNiUeHPu7egL3pyrinr6k=
X-Google-Smtp-Source: AGHT+IGrOLcTdHnWAvTikdGCf6UnlAcc0B+tsmqY9EjgNAatB1fqNxo0UDIF6456Ig9rz2ogunu8BgIZ5Cj1gcf0eoM=
X-Received: by 2002:a05:690e:2457:b0:644:60d9:7514 with SMTP id
 956f58d0204a3-6466a8c5b6emr24385932d50.88.1767307808085; Thu, 01 Jan 2026
 14:50:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251226-02-k3-pinctrl-v2-0-5172397e6831@gentoo.org>
In-Reply-To: <20251226-02-k3-pinctrl-v2-0-5172397e6831@gentoo.org>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Jan 2026 23:49:57 +0100
X-Gmail-Original-Message-ID: <CAD++jL=AeGETR9gT4dO4=MVokCubS4VbbsUdcwShYD8Kjybehg@mail.gmail.com>
X-Gm-Features: AQt7F2rP7_9KdxaprrRWjgopjc31HFpU37nXxJKU_cZD0aXworSU8dVIf4jtxh0
Message-ID: <CAD++jL=AeGETR9gT4dO4=MVokCubS4VbbsUdcwShYD8Kjybehg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] pinctrl: spacemit: add support for K3 SoC
To: Yixun Lan <dlan@gentoo.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yixun,

thanks for your patches!

On Fri, Dec 26, 2025 at 1:58=E2=80=AFPM Yixun Lan <dlan@gentoo.org> wrote:

> This series attempt to add pinctrl support for SpacemiT K3 SoC,
>
> I've removed the RFC tag as the driver is tested on K3 SoC.
>
> The K3 pinctrl IP shares almost same logic with previous K1 SoC generatio=
n,
> but has different register offset and pin configuration, I've introduced
> a pin_to_offset() function to handle the difference of register offset.
> for the drive strength and schmitter trigger settings, they are also chan=
ged.
>
> The patch #1 try to add pin support which should handle pin mux, while pa=
tch #2
> adjust drive strength and schmitter trigger settings accordingly for new =
SoC.
>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>

As Krzysztof mentioned, try to use an explicit device tree schema to
enforce the legal drive strength values as e.g. enums.

Other than this the code looks fine so once the bindings are
ACK:ed I'm ready to merge this.

Yours,
Linus Walleij
