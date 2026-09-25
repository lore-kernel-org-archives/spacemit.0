Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7972D4BC010
	for <spacemit@lists.linux.dev>; Fri, 25 Sep 2026 14:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790348333; cv=none; b=E4d0g4UZrUagg5xrnRpDBEt3tFAFKJ+5cVnKKeVCS6YqUHuV1w+yqfp5QhmlBijICEo4Ih4/6LNCfPCcIruMWg3uI5tRclf0Vk4WUuYKzv4YFraseI8oNgbEjYJ/7ma4uHPgU8zRZBeYHLj15fA7yy5jb1kLqZhFF3jfwzUCXYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790348333; c=relaxed/simple;
	bh=Sknz3FdFSB6JPY2cqVQyaPIiINy7RpwrClA0JIyd34E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=enzV4QW3nML8kLoLQsXjxqwfcLezlS4wLoo2VWCEwFEm5fqbiYhP8+gVDQtKPLmGphQ8fNdaojtefkYj0QSR4ViVSPCnFQGqNRpis8sRqQywtpO2zc6QMKS154frc6iMgzkeiNExVSIoEdpxscQMfHpb4YmoqNw5rXpA35BOn6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=gxZV3Zmi; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="gxZV3Zmi"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4887f690df6so557586f8f.1
        for <spacemit@lists.linux.dev>; Fri, 25 Sep 2026 07:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790348321; x=1790953121; darn=lists.linux.dev;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W3mmzkhyErUd9nhmX6bMHHacdtyTPprVFWqekxL7BwQ=;
        b=gxZV3ZmipeN2ym9UhZaaUGDCig4yY97x6wOt11lMIn567wrzaOKuQBLjUg80k6JsCb
         bMBFrfFgSLh2PIeyv+vS0j6PNt2KCPZF+Naen3lW789LLCUJm9etNZ+kSxeLVQQ4mYX3
         kCxlFRMgn7dxVZkc8SutZbKbrUj5Lsfh1o9/QVkncpitxY0yUAF1nxeXy5U91VcN5E+G
         j34AaKPdcq7umusxG1bQa/qkOSrBksRnd0Tjp68BWAlzXVTwPSWSyipC0KHKokC3PyXs
         78NIFYRjonOI6dx9JOHGkzlZJIh2WgjfSSnC+MsLyaygtSUYlXLLRjbmzZ4eIKdJSx7V
         nadQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790348321; x=1790953121;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W3mmzkhyErUd9nhmX6bMHHacdtyTPprVFWqekxL7BwQ=;
        b=WvqFvJgQpFJz4U/McQSNYx0xmIG7l8sis8wOghbKQqA4RXfvkrI6bPzfmCOSIGPFDC
         dOL6UROy3/T9k+aCeWNkLA+aNuNufY2Ofio+c0K0y9JwJai0Z8l/+JQ0UGpiPGjSHgpF
         hiCFpv/XVYARcvgM4eG/VTBKDYlIjZAgSn5HxL5xqi4NpqiT+VUkmlGuqM4katnhBXaK
         rBACl44GLDAR/t8Hdz5bkASTRkQo4U+1OqkZUxX3V/hpNbTrECXFFWzEAn/A/rh+cOaq
         YhibgkyYdQ0bTuI8VBptuuF113/PacPN2BAEocRFNM6uDS8jALynzyuERt985KSJe7W1
         +u2w==
X-Forwarded-Encrypted: i=1; AKwUvByfO30fjQ5VboE53BCB+yF62r2xkkxjHeZJ30B8ozMlUTMGAR66fZfCJuC0yiGJmVVG94cYQE1mcA==@lists.linux.dev
X-Gm-Message-State: AFuF++k3jzI/O9dXtFYypcvRY/UckSIXYkBrLNAySx3fcj1GapyRTc98
	U1LMBzD016EmamQE9ao8kIkjK2QDZzDekNPyRXPTClkgRlf3V36qwfQZzDDtHL8YbAo=
X-Gm-Gg: AYBFou2KbWq97/I/7zXokjtt5KaDczSnCxB26sHVhaQRMH4cNQ2YxN6ojG1He9O74iw
	Y75QadF1qCxy+gXtIEdefqS9ZgatT0MSrR7hF0QucHtvlIsaPpvuqrlXJuA2TfD7ZCO1lMuB2g2
	41aGRcB6bg6f8U9n0Ts4E3ruEz5EEFWaeoDigkwVFL9SX9e6T5ACA1xYZduP+ohgPOSXyzBpH4p
	J9UgEZL8KsrZcjlERb06ZiD2V1+Cco4lVFQnIG8t2EcB6A6mAtibnHVCLTbs0j+p4OGZnd++RYl
	Q8Rg/TJIYKOcCnHLT1OWvF7cmk2qEDcx4yWuLr7h0dPsO5pUrwFJZvq66CEOTVJvMHIyQrCUDUU
	xzg22JtZR3Q9ggT4BZqIRxBmgqizSK6pU5dy/UNgfrDv0UYk1tRtwywXd6TSBN1Q0XnEGnBL2Kq
	OqlB8I3wa+UJWKRirMJBJSrNvyHhdgB3qYnPHZcq1qTPION8CMP6lcLx8pNQz18k+zwtgp3Ws1k
	9Gb3QUe+0cTDHYWZA==
X-Received: by 2002:a05:600c:154b:b0:49c:ed94:cdd8 with SMTP id 5b1f17b1804b1-49fe66c863cmr109626585e9.6.1790348321076;
        Fri, 25 Sep 2026 07:58:41 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff13b3c58sm27350435e9.0.2026.09.25.07.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 07:58:39 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet
 <jbrunet+clk@baylibre.com>, Yixun Lan <dlan@kernel.org>, Alex Elder
 <elder@riscstar.com>, Inochi Amaoto <inochiama@outlook.com>, Haylen Chu
 <heylenay@4d2.org>
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, Troy Mitchell
 <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH 0/5] clk: spacemit: preserve and safely synchronize
 firmware PLLs
In-Reply-To: <20260909-spacemit-pll-init-v1-0-b3065ad5a4ac@linux.spacemit.com>
References: <20260909-spacemit-pll-init-v1-0-b3065ad5a4ac@linux.spacemit.com>
Date: Fri, 25 Sep 2026 16:58:38 +0200
Message-ID: <1jtsnd74yp.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On mer. 09 sept. 2026 at 22:07, Troy Mitchell <troy.mitchell@linux.spacemit.com> wrote:

> Firmware may leave PLLs running with valid settings absent from Linux's
> rate tables. Replacing those settings during clock registration can
> stop CPUs that depend on them.

A provider should not act on the clock on its own. 

>
> This series removes the init fallback to the first rate-table entry,
> decodes hardware rates directly and preserves unlisted rates. Opt-in
> synchronization applies only to differing parameters for the same
> decoded rate.

Don't think the provider should be responsible for that

> It temporarily moves mapped CPU consumers to validated
> PLL1 branches and restores their parents after the reprogrammed PLL
> locks.

This is typically a use case or policy choice that belong in whatever
consumes the clock. Your DVFS driver maybe ?

> PLL1 itself is not synchronized, and enabled outputs outside the
> managed CPU paths prevent synchronization.
>
> The series also corrects CPU divider and shared-parent modeling and
> makes MIX rate selection agree with programming. Runtime PLL rate
> changes still require a stopped PLL; automatic DVFS switching and new
> rate-table entries are outside this series.
>
> ---
> Troy Mitchell (5):
>       clk: spacemit: derive PLL rates from hardware
>       clk: spacemit: make MIX rate selection consistent
>       clk: spacemit: describe CPU clock dividers and shared PLL muxes
>       clk: spacemit: reject rate changes to running firmware PLLs
>       clk: spacemit: safely synchronize PLL parameters during init
>
>  drivers/clk/spacemit/ccu-k1.c     |  60 +++--
>  drivers/clk/spacemit/ccu-k3.c     | 137 +++++++---
>  drivers/clk/spacemit/ccu_common.c |  12 +
>  drivers/clk/spacemit/ccu_common.h |   2 +
>  drivers/clk/spacemit/ccu_mix.c    |  35 ++-
>  drivers/clk/spacemit/ccu_mix.h    |  18 ++
>  drivers/clk/spacemit/ccu_pll.c    | 535 +++++++++++++++++++++++++++++++-------
>  drivers/clk/spacemit/ccu_pll.h    |  43 ++-
>  8 files changed, 689 insertions(+), 153 deletions(-)
> ---
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> change-id: 20260907-spacemit-pll-init-c942bb249244
>
> Best regards,
> --  
> Troy Mitchell <troy.mitchell@linux.spacemit.com>
>

-- 
Jerome
