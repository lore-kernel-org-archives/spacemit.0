Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792985899;
	b=G4+sEz02y00CqRZW0ql4DXOfeAwdr7rU50QT5VvULuvJnSw0vJQwsD3WVlKE55jh4dzL
	 oydSkMhpFurcdckMX+Naj1Zy2rO7ig5Ov9z/GLNXFxByV3iyL5ZbffgyDSL7xLWKKuI+n
	 KJkWf3nQu6nZkkFS6gOJ87HCQ2UO3/sS7O8BaFRBrWUv/w4RaownhJ+zCvSuJxWTXZQkI
	 w6of15ADsipAzrdNATxYNNY/+2leGw5Ynra/NagCTBMexhRhAI4L0snHMUhaPlqLs4kos
	 rs5AI2MOKYCSkDEPOTcizmtxZ1m29TR9sQNLQIBmYlKVJFmgZrILC9RyJMX48az1phQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792985899;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LJ/LLdUvbUXDscVG28+mEznHp6VW8smsqWPUjig3N5U=;
	b=eFPT217M0/VNeScAzMO4xfTBJjTXw4+LFyx3VGHZmeSGTvE7fPOuTxiE6p/M4AuH43tD
	 /mFuQ12DS/jrTZmJUL0R7qcfUqkzUyeIVf6VjKQopuMtMH2fQgoJrbfIIK/7fdIJ4Zand
	 RU4fqOD/jtkba/Lf29keQVBrXYOeVr5eLuxNC2BPYC9yMViEKVfA7bR5safQIH1Gx6Xjs
	 uzjc1e8pLP/CWatnMfOhYZ27mW248colCgocyWsoUxVoAUB8kK42fPa6nktzaWQ/hdrKb
	 0K8m8ELUveCjnkpVMmyZT4e6W/kCTSvj4SypxLzYzm5C1Qzs39gdOXURlPqZitg6sIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NBo2X8Ob;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D23606A323
	for <spacemit@lists.linux.dev>; Mon, 26 Oct 2026 03:38:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7D23606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NBo2X8Ob
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8a05f2d5cd3so949186b3a.0
        for <spacemit@lists.linux.dev>; Sun, 25 Oct 2026 20:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792985898; x=1793590698; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LJ/LLdUvbUXDscVG28+mEznHp6VW8smsqWPUjig3N5U=;
        b=NBo2X8ObM82SO9ZNaQ53DA0a8n+OS8bjA9mVSv4Z5/hmLivsZ7MG1mMqGNMITy/A0U
         RoLeT8IrxMPZ3yzofU46CgpbzURuAMuLUdbeo4j7wKPCXJQbGcHDLgyOSqB7kprVmJSR
         XQoAA8mKIv1qM6BIzGNWLAZfN+22U/mKGJf46hed19z4HCkPNfXY9DZbp50uCqDvDdZ3
         5gWFJPZ0bF3T4juA9pTz2lc3RVVNjxygSEJhdJpxYt/41CH9VOUSehC8MkOa/ooyPFhO
         b69gqf4Rhi+2U5cWdgzlv6WLKiFF2DRlwEHWq9t1v1u2OBiUbmzwyqh8mZHpZLZbE9Lr
         V/zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792985898; x=1793590698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LJ/LLdUvbUXDscVG28+mEznHp6VW8smsqWPUjig3N5U=;
        b=0PXtP7wTVeJCpOIL304zS4hIMagpoC8m4ieSqbWWsMDttcaKi3C9k+Uc5UFix/jlDj
         3Zy+ITxyx8l5CWBBJD/UyPbH9ECHYjjbqiNlM0VliCT1gFWFgQ/TjChsLfAaCFAj5sx3
         o2VGXD2R1C+T3migYcks/ITWzOTqTAtpNF2Of0/vWGEM2PFGyj2Osgxksioke7qHuD7N
         8nWi0GXTBsR3z+j20/Fkl7uKpU9UcjeFrWrLodIN81eo+cVl/Urfa//PUpun+jG3NjyX
         bZ+uK2FUh2Zsmk0ZnwJNEfRDPb3+kYNGfoJLMZ2hecnqjUsojKu6C2RPCOz3aAxUafno
         Cypg==
X-Forwarded-Encrypted: i=1; AKwUvByQEjDFGv3nJh93Dk/JtB0F+QVynBjpmLRBn8rsma2AcHeWLpkxIh/ivBMK5eYOWrFgXabtcOt0og==@lists.linux.dev
X-Gm-Message-State: AFq9FYJJzhzgzC7I1RhmUuei0UEehEjBC64c/H5jIhDviH9SxKRcAQPW
	+Z/k7MZnKMxD0rg0FBGezF9KD6fbWukD/4Cq+ROq9DyIVzK+7BLJbr26
X-Gm-Gg: AYBFou01V83ptH9CyZ2SyprxS4x6Yy2u2eG5qZtHc+NZga3HahS0nNUVJAFnowHLMt8
	KKBhUzWo3szp0ZOjt+EaqxV3sT13yX18MukwXl05W9AJ/bI+CEawbawgxDpF8uTmhuyIOWqosFD
	NduKYFHy8Q9HVOjEls2VtTKHF73uiFM39Vw1HgDyBzCrhBGQVsEYCCnjURd9M7FaCxL7XhoLSA5
	XvE0ZjQWKdz7kx9IpLRdxz8493JSMX/4+bVEJo1KSgA+6cNI2HfC88TqZkFze5PG3tv/ATCAIbS
	bey+WKruCZGegDICLwUpWm5hvcL/pNxCdITCIMYjNZv/IK/DBuRRlsPKftENdkFRTq2tiZzaSU1
	lzn/O8ah2PS7/CjI9qaLQp9Vxx13pQfJe5Nv8Cem+t4RAMbg6QkpZVEd3nMmwoPWRKlGN2cQ1c8
	4cknUh4PvPT6NM/yVfo0G+QLYB9tHR9RZVgnOgu4YNGuaxppR/tSOaCQ9Vvf9fCvQpi4mvIjFGG
	j6DjKK2M2950pzAuQn3WW/q2e6WcpOI+C6elP6qBoK8nc4L4FXxCIUb4zVA3vcBaHnoWP5G3kE3
	MhBj/Iq8NmoThbQyTloI2K0yN3MsX/+aQ1BgKJdkijgp0+n7Oks/tv86hWDIrGPoLZhG/pC4Wdp
	kMitae8BcYv0VjfwezztmNCDDcIaKVm6vEwMveoEro+rWSGL1oBWueaFw
X-Received: by 2002:a05:6300:6bc9:b0:3e1:bd77:2c92 with SMTP id adf61e73a8af0-3e7cd4cbe1bmr3717741637.68.1792985898172;
        Sun, 25 Oct 2026 20:38:18 -0700 (PDT)
Received: from alanhc-14700.tailb22ec2.ts.net (180-177-138-120.dynamic.kbronet.com.tw. [180.177.138.120])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ccc21017sm989192a12.10.2026.10.25.20.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 20:38:17 -0700 (PDT)
From: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
To: E Shattow <e@freeshell.de>
Cc: dlan@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] riscv: dts: spacemit: mark K1 boot nodes bootph-pre-ram
Date: Mon, 26 Oct 2026 11:38:11 +0800
Message-ID: <20261026033813.432250-1-alan.tseng.cs@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <813d3f4a-66a9-48df-b9de-6a46b9388d0a@freeshell.de>
References: <20261024092558.143621-1-alan.tseng.cs@gmail.com> <813d3f4a-66a9-48df-b9de-6a46b9388d0a@freeshell.de>
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi E,

On 10/24/26 07:45, E Shattow wrote:
> Split the patches in this series so we have a clearly defined initial
> changeset that does "Extend the BootROM configured peripherals to device
> tree bootph-pre-ram hints for any SPL loaded by that BootROM in SD,
> eMMC, and SPI NOR boot modes".

Thanks, that makes sense. For v4 I plan this split:

1. BootROM: the fixed clocks, the clock and reset controllers, uart0,
   sdhci0, emmc and qspi in k1.dtsi, and the SPI NOR flash@0 in the
   board files.

2. DRAM setup, as an add-on for Yixun to take or leave: i2c2 and i2c8
   in k1.dtsi, and the EEPROM, the PMIC and its buck1, buck3 and aldo1
   in the board files.

> Capture all the BootROM SPL loader flows
> that we can understand (USB missing currently? please add this)

USB download mode goes through the OTG port (FDL button, then
"fastboot stage"), but mainline has no node for the USB2 OTG
controller behind it yet. The DWC3 is a different controller. So there
is nothing to tag for USB today, and I'd add it once that node lands.

Yixun, could you confirm that the BootROM uses that OTG controller for
USB download, and that it does not touch the DWC3?

Does this split look right to you? I'll send v4 after the merge window.

Thanks,
Hung-Chun
