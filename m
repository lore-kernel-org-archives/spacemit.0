Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E9426B0B7
	for <spacemit@lists.linux.dev>; Thu, 15 Jan 2026 04:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768452064; cv=none; b=Dns1Ws6qpZsNz7xIUXP13RL1bIuJjy0MzXGm2M8tWcsA1g/j9ucDEdD00WYphSVVxUB/N7F7BXsMlG0FiP2rDGwajp2t5/okjhGd5wrBHEn494HB+lgBydfteffh1jp/FFzmoFj8POW5VS44+Kig3ZC6g53Zl2tsHNX3J7IVFhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768452064; c=relaxed/simple;
	bh=ThFCUVoJORkTHigwP6KFyI5JXW+srDiOPsF1PLs4gRA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sC9djl0FE0ClqUMdsEawR3864dVnOJXl0W3Edck7D4e+dWIpxnaYqM3cl+zAxGI8lSSE6N+LPvLFtAFe+qujiQc9XefeaxYjeWG6SNsNuQQkhHsTw5snq3i7avV8sbQyNdvNRrQQC5M25NPI/9DOadKyYZzuLjmyrK9dpxLozTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=ytm+G5yI; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="ytm+G5yI"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-7927b3e5253so4148557b3.1
        for <spacemit@lists.linux.dev>; Wed, 14 Jan 2026 20:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768452062; x=1769056862; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UHORsUrCGxhFKBEYnnmZVqnwkkEcReBR9XoRnnvUNsA=;
        b=ytm+G5yIWXZKW2t5rjcEDrjb7HLJ5wxW5TTwEmLlS2X1bO1yvlsi6A+BSYIc0YK7gT
         RopUVFSYtAKUIHrlFwU5OilB7bamW/B2lcj+4qri6K/P3YQPd/nNH9dq0hbzQQx0Y0di
         fPf8uZjj1D3mUnh8pL6nkl0VApjtC6J+AqkF+cJcjuOtz4yRh62gBz/2+RrlJXOMrFsB
         xNV8+xcZ2qdczIK0T28UVCwEYuEAbCegzoeoQQgs1LQPF2yZgkDfvCE3qh+EQFEPIrem
         QATICJNsdLBCItqvbeTTCZ9KdY45tK965lc71/XtUklUsq7lGGKW/kQGoWWaBKf8JIRY
         63SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768452062; x=1769056862;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UHORsUrCGxhFKBEYnnmZVqnwkkEcReBR9XoRnnvUNsA=;
        b=RsxLsRxCMPucNmQMgqPfTIUqxoAbzJ6eq5oz7W/dkg9xFBqXzwSAWeZNRYmOSGCP2Y
         ieC4I7OnoinXDlgaTaSheyXwYpourtD65WcydsOzURI9kAiHRj4OVnKJkQZMRLYuU/LN
         j1DfOFHFX4+wyrtt7Io6jAdCZ4bkuXG5ISbHVQKfucWc1gYCnnRJOaJnKN1IPhOWej3V
         GVJxik8YTcgmwlJL/b6lVZCseMTRUBCXl2EItAO0uqepug3Rv8U/XLS9XuY+bN1VF9jo
         y0aC75Y/48glRjkzsSW2t5sbIquHSgHQOwrhYJmimHqsY154pBki8t9xC5WEuWadnB2T
         8gKw==
X-Forwarded-Encrypted: i=1; AJvYcCU+iXXFw7Q7ybqaonsfvA3g0y4jv6HzAn3nCKvn8fiJ1VAwnqO1oM6h+uT3c26nQ6b3S6226YLkvA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyzIzYBL2sVyZoxqDNIcJMEKsvhUsRtK8sa9+T3c5202xJUwkC0
	0KRCh6DpHkRRza9O/NdPqE12QMAWUl9cYELCSIqSW8bi03GO5mJuQ0673PzQng/dKDmn2/xYxzU
	BaxjBWQGDrQ+S+5IxIZTN/F5PHGCoX6ASsGtvWIj8yg==
X-Gm-Gg: AY/fxX5e2ZAYjzCGCkZnf1PElj1hpiIr2I2xzrPeEQqfISZlqb1891e6tY1MHn+J9q5
	WXtn9BfZcioSjkuDnYs4fwvoPArIzofsWfs0Wqh0P7ljFaE3ClRaFPzg7glFiVCxCb4d1fNeb0h
	tDS2ggdC2Qs9Hug8O+7NHgI6Bc6Zy8oyvk/ax/hRIjQsfFY4GSVgrLdtSQqjD32619ONXzZDo9w
	tDfC9rL3y1R5g/+bSvkuGBavYkaFMXmy52+nzL+qqpnBxuCXAr3XZ57Cg2+rnAjsKqKLpyMF1Il
	dH5trrbEdsLQzxOjoSwe/pP4Tae5gdShMBosgg==
X-Received: by 2002:a05:690e:14c8:b0:644:4259:9b63 with SMTP id
 956f58d0204a3-64903b1d0e0mr3032668d50.41.1768452061481; Wed, 14 Jan 2026
 20:41:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260108-k3-reset-v2-0-457df235efe9@riscstar.com>
In-Reply-To: <20260108-k3-reset-v2-0-457df235efe9@riscstar.com>
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 15 Jan 2026 12:40:50 +0800
X-Gm-Features: AZwV_Qgg7yPvsd_zYkdWW175mtNGzIR7tHiFYjvfgqt1QtUiV4wnMaVSXFiifeg
Message-ID: <CAH1PCMa8kXx=5_3UrcbnJH21kQm13QdFeUcBDUboiCnACzbiVw@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] reset: spacemit: Add support for SpacemiT K3 SoC
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Haylen Chu <heylenay@4d2.org>
Cc: Alex Elder <elder@riscstar.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Philipp

On Thu, Jan 8, 2026 at 10:22=E2=80=AFPM Guodong Xu <guodong@riscstar.com> w=
rote:
> This patchset is based on v6.19-rc4 and depends on the K3 clock drirver
> patchset [3] and the K1 common clock work [2] and [1]:
>
> Link: https://lore.kernel.org/all/20251219012819.440972-1-inochiama@gmail=
.com/ [1]
> Link: https://lore.kernel.org/lkml/20260108-06-k1-clk-common-v4-0-badf635=
993d3@gentoo.org/ [2]
> Link: https://lore.kernel.org/lkml/20260108-k3-clk-v5-0-42a11b74ad58@gent=
oo.org/ [3]

I am writing to update the status of these dependencies.

The clock patches have been accepted and are now present in linux-next
(since next-20260113).

To facilitate the merging of this reset driver, Yixun Lan has created an
immutable tag within his pull request to the clock subsystem. As noted
in his PR [5]:

> Please pull SpacemiT's clock changes for v6.20, This PR basically adds
> support for SpacemiT new K3 SoC, while doing this I've created an immutab=
le
> tag (spacemit-clkrst-v6.20-3) for reset driver in case it also needs to b=
e
> merged during same merge window, otherwise everything is normal.

Since the dependencies are now available via this immutable tag, are there
any further comments on this series, or steps I should take to utilize that
tag for a v3?

Thank you.

Link: https://lore.kernel.org/spacemit/20260114092742-GYC7933267@gentoo.org=
/ [5]

Best regards,
Guodong




> Link: https://lore.kernel.org/all/cc1cb833-2c4a-4e20-a50d-109a4919e274@ri=
scstar.com/ [4]
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
>  drivers/reset/spacemit/Makefile                    |   6 +
>  drivers/reset/spacemit/reset-spacemit-common.c     |  77 +++++++
>  drivers/reset/spacemit/reset-spacemit-common.h     |  42 ++++
>  .../reset-spacemit-k1.c}                           | 107 +---------
>  drivers/reset/spacemit/reset-spacemit-k3.c         | 233 +++++++++++++++=
++++++
>  include/dt-bindings/reset/spacemit,k3-resets.h     | 171 +++++++++++++++
>  10 files changed, 584 insertions(+), 110 deletions(-)
> ---
> base-commit: f10c325a345fef0a688a2bcdfab1540d1c924148
> change-id: 20251229-k3-reset-8d9b751ef391
> prerequisite-message-id: <20251219012819.440972-1-inochiama@gmail.com>
> prerequisite-patch-id: df430730ed961011cee5c5d47b7ace84b3c5ebb7
> prerequisite-patch-id: 64003618c33be925602e46b7543f2c13d3f36474
> prerequisite-message-id: <20260108-06-k1-clk-common-v4-0-badf635993d3@gen=
too.org>
> prerequisite-patch-id: 96cd13293b888c05f400daf529c3cacf17ddf002
> prerequisite-patch-id: 5f6579799919c4e2e12c8c836ac4164b00ccaaa3
> prerequisite-patch-id: 11e8d5cbe6f3610aa362dc0051b3173001d0a5f4
> prerequisite-patch-id: 622d6606913609be04f66006609550e8c3e7f22b
> prerequisite-message-id: <20260108-k3-clk-v5-0-42a11b74ad58@gentoo.org>
> prerequisite-patch-id: 44a51fa6a6f0f9d2c5b7bf3295f3272d6bb7005a
> prerequisite-patch-id: dce85ac6e4e94b1d2622a8231ddab3de766373ff
> prerequisite-patch-id: af1fb571f0d19d72e69dd41d15fc2dbd730b17c7
> prerequisite-patch-id: 1318bffbbe6044cb4ef0f77c6756ff96d69ecdf3
> prerequisite-patch-id: 8856cecc299cdffcd18acf9a7476175a4d65e62e
>
> Best regards,
> --
> Guodong Xu <guodong@riscstar.com>
>
