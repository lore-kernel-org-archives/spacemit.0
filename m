Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B034D3939BA
	for <spacemit@lists.linux.dev>; Tue, 14 Apr 2026 08:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776154476; cv=none; b=s27JpWfn/mz/Sxqq8ha9wuosfEEJHKM23XpEt/0/xR8BZkA9B1PK0NFVzfGwGJDbFMFrEUo8xyvJWJ1pRmZCbkkU5cJXUXcQQBYhE2Iy0RBZIxpWUZm8DmN6mp0jpYeh6rwZKe60Uy5nxrJEJJe5DsIco8poeddWxrw2fokyG/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776154476; c=relaxed/simple;
	bh=3EfHadgTZizCs2YTDIikcllKAbYD3PM4lNlIMq0xj6E=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=BDu8Ff6Lz8CkSFzU+7zJp2uPFfOhzQzUA5NSESG5k+kurtJJif/FHht+SPS8vD7vlq6hore2YDefwBWbtQbA2qpWVvPd630SiNOHHalC2sxX6mI6ToW9HhWNzdZAae5WjqgJKX/w7d1C+6evaAg13jPaDksn+NhhKrx6raeVed8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.dev; spf=none smtp.mailfrom=linux.spacemit.com; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
X-QQ-mid: esmtpgz11t1776154412t2aeae6dd
X-QQ-Originating-IP: t5qvFoqOO49dshmNhNcUn+LEJies/jN4pY7I/s4bMd4=
Received: from = ( [183.48.244.18])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 14 Apr 2026 16:13:29 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8640859911972310649
X-QQ-CSender: troy.mitchell@linux.spacemit.com
Sender: troy.mitchell@linux.spacemit.com
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 14 Apr 2026 16:13:29 +0800
Message-Id: <DHSQ6VG82QYX.1EVAYV9JTBCL7@linux.dev>
Cc: "Ulf Hansson" <ulf.hansson@linaro.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Adrian Hunter" <adrian.hunter@intel.com>, "Paul
 Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Yixun Lan"
 <dlan@kernel.org>, "Troy Mitchell" <troy.mitchell@linux.dev>, "Michael
 Opdenacker" <michael.opdenacker@rootcommit.com>, "Javier Martinez Canillas"
 <javierm@redhat.com>, <linux-mmc@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Anand Moon"
 <linux.amoon@gmail.com>, "Trevor Gamblin" <tgamblin@baylibre.com>, "Vincent
 Legoll" <legoll@online.fr>
Subject: Re: [PATCH v8 0/9] riscv: spacemit: enable SD card support with UHS
 modes for OrangePi RV2
From: "Troy Mitchell" <troy.mitchell@linux.dev>
To: "Iker Pedrosa" <ikerpedrosam@gmail.com>, "Krzysztof Kozlowski"
 <krzk@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260413-orangepi-sd-card-uhs-v8-0-c21c40ec16d0@gmail.com>
 <f58ec12c-3957-4d44-b823-6a1ae1a1dd94@kernel.org>
 <CABdCQ=NhTkGJUh_fKnZoQMzdpyO-UbV5zrSfiNVUC7bkSBifTA@mail.gmail.com>
In-Reply-To: <CABdCQ=NhTkGJUh_fKnZoQMzdpyO-UbV5zrSfiNVUC7bkSBifTA@mail.gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Ml2CtnvVxCrQJxGAfPQHvPdstOAa3GYTKp6lVRD+aEk1r3+JqCzFFeMo
	bWPtg195NqBKg0ut99zsNZLNrZ/fGkH1QD5z1x5aPLd/pUzDLtVK+Xtu6WVaPxL180GHDVq
	8inA1UPBznhbiLY3Av64KcLnjk/93uqagCcX4oEu25n29e4UuhXH0AnlmDnBp32kXkA2yqn
	a6XHSF0C0Sa+ZE8la4fiar93/D1Lp4GUCvzjLbCKr42RQvx69ENuVev39Y7qoAmUWo6mpPw
	rGhFZPGAhaM/DrjfceTY4+y1lBBjhJZt1qrb/pSGrKai2neS10khA3h4ERgiBNpumhIMu8R
	lN2d4YBezle8MLWV2Onl6MLgugVMgvA4PX0YDLLQseby6hI1KvBByrO5pY4UthWA3ttF40f
	biOsEjG3GaksHSOAHzCL0Lymt1e9C21J0aIX+68LEYV48cNulqiQa0epdA/N/gbeGw2XHJ/
	wGOo/4DX7odjImSDwim9hed+jOe2hLotN0vHb4UUpwhJ6wNAR/hY1fGp/pttcHjJFWbZOY1
	dJogC6Q66Q3EGlvSaeJ48mwSgU5N/Smf30qiYcHGymjyDRihkP2gSNhn3kZztUgRh7wOZDv
	RIY2jkv1e+FS2ISrHFoXUEnGTpqPQ2nuxQSPLVTISfNBXlMjmZPi9ge8j9nrpGYz0khkoF9
	OCkVDdmrIwKlzkpe9uDUOUvcx4tqgb3G7jHskK+/nZSYkpXGUXgrrlgOIcCvDMvuRzaDQZk
	CeMuoK1DjOdFc3TKfwcTx7W+kbII+Z1SZm0c+lDRdOJ+cgsSGvOQSTlXZH/qx1h/S0HL9il
	NCko3hUO6fvia06026rJCPP/zUZ69icN+81idy5P0Mbt29gJp5GCqBuD/yT9mHOljC7IzbY
	eYCTj5TrhHk0C1f3eTzEOCQm8rO8p0SIINnJYMutF8x2dVX5JlQaNuZRcKBJDrS+lptg4h6
	2ubCAXmCo+iPJmFI3IjcHqV/phT90T4MiSInUcUP+d9iua0Nza2OHWqr/zvxUzUV8b2RIQM
	5mcfAbUluGoKixtZkGHAbaEPUi28nj5IGrCd0YxNqJubTvHc6DlnnypdwZKUB2PKDkikgBs
	7kzJ0yq2Nf7
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0

On Tue Apr 14, 2026 at 3:12 PM CST, Iker Pedrosa wrote:
> El lun, 13 abr 2026 a las 10:07, Krzysztof Kozlowski
> (<krzk@kernel.org>) escribi=C3=B3:
>>
>> On 13/04/2026 10:02, Iker Pedrosa wrote:
>> > This series enables complete SD card support for the Spacemit K1-based
>> > OrangePi RV2 board, including UHS (Ultra High Speed) modes for
>> > high-performance SD card operation.
>> >
>> > Background
>> >
>> > The Spacemit K1 SoC includes an SDHCI controller capable of supporting
>> > SD cards up to UHS-I speeds (SDR104 at 208MHz). However, mainline
>> > currently lacks basic SD controller configuration, SDHCI driver
>> > enhancements for voltage switching and tuning, and power management
>> > infrastructure.
>> >
>> > Implementation
>> >
>> > The series enables SD card support through coordinated layers:
>> >
>> > - Hardware infrastructure (patches 1-2): Device tree bindings for volt=
age
>> > switching hardware and essential clock infrastructure.
>> > - SDHCI driver enhancements (patches 3-7): Regulator framework
>> > integration, pinctrl state switching for voltage domains, AIB register
>> > programming, and comprehensive SDR tuning support for reliable UHS
>> > operation.
>> > - SoC and board integration (patches 8-10): Complete K1 SoC controller
>> > definitions, PMIC power infrastructure, and OrangePi RV2 board enablem=
ent
>> > with full UHS support.
>> >
>> > This transforms the OrangePi RV2 from having no SD card support to ful=
l
>> > UHS-I capability, enabling high-performance storage up to 208MHz.
>> >
>> > Tested-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
>> > Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
>> > ---
>> > Changes in v8:
>> > - Resending the series as v8. The v7 submission failed due to an SMTP
>> >   error during transit, which resulted in a broken thread on the maili=
ng
>> >   list.
>>
>> Hm? Everything is here:
>> https://lore.kernel.org/all/20260413-orangepi-sd-card-uhs-v7-1-16650f49c=
022@gmail.com/
>>
>> You can send individual patches to fix up threading, use --in-reply-to.
>
> My apologies for the noise and the rapid resend.
>
> The reason for v8 was that the v7 cover letter (0/9) failed to reach
> the mailing list due to an SMTP error on my end. This left the v7
> thread "headless" in the archives without the changelog or the full
> context of the series. I was attempting to fix the threading
> immediately so that reviewers would have a complete set of patches to
> look at, but I realize now that resending the entire series on the
> same day was premature.
So that's why Krzysztof said you should send individual patch with --in-rep=
ly-to.

                                      - Troy
