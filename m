Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B64C4F55B5
	for <spacemit@lists.linux.dev>; Mon, 19 Oct 2026 14:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792419468; cv=none; b=XdnGoUUODBx1uw3sczFZrYSPr1HjDPb/ucJ4qiI+OLr8tv3uz30H6W0hFBeqkYkixppvLlxsXwAloqZbdFvBW2fJYCuR2TIRE3Ty0uQ0KSuZu71iK8FmbOzxX+oTsoisD+y2ygg9Uyqu4gzfg9zCdrtqCDdRHIfA31yvGqUq9gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792419468; c=relaxed/simple;
	bh=a9xujErffccRWJmb2kmaLMfqp7WKEG50k3ZOPDrgYt4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a8Lgy1wZA9fuggwTjYmcyTtf2wsuRCWo0c5L1ij8UZdaIZkqs4YOC91tMwcIF/6J+6QIxDU1V/1YJa2wryerlFhQr51FcJZ3Cu4Hd0sg+JWB6d5Yvk53WB+tM66Yq1aQ/K28Gr6PGUn+i1X72Y+nkCefhxqeuBL+fSTpue9bMvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qn9Wy1HQ; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qn9Wy1HQ"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2dd76b1361dso11027975ad.1
        for <spacemit@lists.linux.dev>; Mon, 19 Oct 2026 07:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792419467; x=1793024267; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a9xujErffccRWJmb2kmaLMfqp7WKEG50k3ZOPDrgYt4=;
        b=Qn9Wy1HQi8QYxSO4zN582kgBnz2P/AFkUbhMMfhYvzwqItP0Po20/l/kS0vdhIQ+ZU
         IvkIhjaXwqse7yd+x2B6eiV3CRABqUvJOa8nbSK69wXlOIORqhBXJqRr/1uRucrofAMP
         YPP2kH24URdbawNRnLV67cSpFkSexpSANqfumk6be1JtuDSvCyY/pC2tiOboAN14Ocau
         BqonDMToxIn9G2wWPRxEQsTWUkr1p3JHZr/PnwbvuYrKfxs8OgF4zkOcxZDMrcEMhOOj
         6c5QYvp4oqzAMhLAKWTkYpnC75HXaA7VTLGeiZGksFwXYKE1SYjHJ9RLcnjSDy/jz8Ye
         Jhjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792419467; x=1793024267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a9xujErffccRWJmb2kmaLMfqp7WKEG50k3ZOPDrgYt4=;
        b=OkWD6tZjvP4HnTN5IXkrk5cyJPFYk5AaQVbs/b4yLAzXBuntSwPoP8VY2MxbX/Xsqs
         1pp5q2F/H6NMjg2OBPQ4y9gsM3GYyxZZi/pxbjeOwBJ9SibtB2AnEV4DWSXD6MzQ7AYx
         vWIhcSZTsgn8klAtjcgQnco6ulePfDv5SXlVx1x0N78nR9MC5XY807Jb2x7zuo7VHP2X
         KANmENAi4BrzX7uZTQFyeU/rZ3GqS7iMDWcWageJD7txw0p+JqJJV45fxD7IckVoU/bQ
         XkKKTPGK9LC3dVhaGBb+557RJxGi0rix1xMDdc2Z+P6qR+kCWjutrD8+oMLGekH5zzMI
         WKfw==
X-Forwarded-Encrypted: i=1; AKwUvBxFzUaX8J+klEW05sR8O/8Eww63ux165DS5h0Kfe01cKglMGzrA+qoyAuPbMF09fydcKdEduxd/YQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYKG/sCO+UUwM82AV7rsD8g3B9vaIvuxqT50rOs9t7lhBztRDK8L
	h0SrVCBxyJuuvd91f44SxqRKWsppgK+RZZE/hDCBni8NzFv18omGtNSz
X-Gm-Gg: AYBFou1kj8TSDGsgi57/2wdrmXeOVbtel6rE+QWGziAQzuJVvl0Nfz9I2Q1hmKeC7SD
	A1bI4Jbk7TsUNOghrlaBQrCEiNh+7SCM5/rb14IeF8uAZrMs8f0OjBvg0081IybLtBYDFwCApfB
	rATQTxw4dnNbAYKm/dRtr8DuqVghK7Hux8gg/yjfNR2R9sHGn0VSyf5ScDAQZHnKybFNjMNI8yv
	tAPB6DVtRi2iVGj0q5mic0QO2tMTDNLpW80C0fmSxydRI4DcaWAvv/5XYdfFqAyNcN95nZq5sj8
	jYEFdv0ve4OxEV+WnRiGoxhIKoGUagVIcdnAHQYk5D/Mx8hSusjq22XcoEpKrJIghlVXR8spcG3
	nuzAcJFxrvGwGPcDs0iQgfoHvKWiCtHB3TuLIWEoWwnH0pPhnkbbnKcNzm4HewXLNG8h21lo++R
	cpdQyjReSkatRSDm9oFFm3o/Goi3EnxSWvX0doKewF2gHQ1+feimk2LoL9aY1GaxIvylCpNg2/Y
	NPrNiUypNuLf+u6LN/IcLaUMZdq+T+AIbiHsHN16w/pafDu+jITHqUjxe4GLF+ffNdesH3GWt72
	m5pMEpfFvMXo8KrOTus6ip2R6lJWNzj+n6dgbzVOUYef6s9HODm2EA==
X-Received: by 2002:a17:902:e943:b0:2e9:79db:449c with SMTP id d9443c01a7336-2e9a6f55653mr62822605ad.47.1792419466462;
        Mon, 19 Oct 2026 07:17:46 -0700 (PDT)
Received: from alanhc-14700.tailb22ec2.ts.net (180-177-138-120.dynamic.kbronet.com.tw. [180.177.138.120])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea1501f933sm1697925ad.50.2026.10.19.07.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:17:46 -0700 (PDT)
From: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
To: E Shattow <e@freeshell.de>
Cc: Yixun Lan <dlan@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] riscv: dts: spacemit: k1: mark boot-critical SoC nodes bootph-pre-ram
Date: Mon, 19 Oct 2026 22:17:38 +0800
Message-ID: <20261019141740.2077086-1-alan.tseng.cs@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <05e0c9e4-4e27-4114-866a-ec55c33ba349@freeshell.de>
References: <20261017180141.3477743-2-alan.tseng.cs@gmail.com> <05e0c9e4-4e27-4114-866a-ec55c33ba349@freeshell.de>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi E,

E Shattow wrote:
> Drop this last paragraph/sentence or place after scissors line, not for
> the commit message itself.

Thanks, I will drop it in v3.

> Presumably the BootROM does configure all of the above?

Mostly. The boot straps select SD, eMMC, SPI NOR or NAND, and the
BootROM loads the SPL from there, so the SPL needs the same
controllers and the clock and reset controllers behind them. The
BootROM also prints to the console UART.

i2c8 is different. The BootROM does not touch the PMIC, but the SPL
has to set the PMIC regulators over i2c8 before it can bring up DRAM.
I will give that as the reason in v3 instead of the U-Boot sentence.

The BootROM can also load the SPL over USB fastboot. I left USB out
of this series and can add it in a follow-up.

Thanks for the review.

Hung-Chun
