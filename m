Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792993475;
	b=T/rAWOLiu1hxRNi1MYgDfNTKXcKuCo1QyiZ9Q3YBOLfwHsOUu/2snmaomE7wO8SHyacw
	 PidR3a5x4MOxOToFN6aZZxgpXKeXTcWoLg8HUGfvCmeX71YvVckvb+yvaOSkmKKn+Ap5M
	 YfVxCennNifndAqF7GuYWcOT3ehqufaXjAtqB7V2R5YRvC7xaNEY2YjisnByt82tvqCzq
	 92jx4GlWkJQC8uwk67C/9rFkEnRtfyUVPQlEWTK4q0sQOnP2u9BinMMYw/nEkICx34P1A
	 VByD2ZNCdM0e2WeGUS4g5P7XyB8trZPDGlyfEdh6rWkTjBCkIXr87fqp3WSJ2BLHPpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792993475;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Pb4KDmZUh437ZZnXb7B8ESYwa24YJGu0HgUrWTWCI2k=;
	b=bOZ8ymXzl0ZftyxQCHIu6VM8Kaa8UuXw7600jfkn2/TZF+RKvRSNNcch/+qpxVqgGfm+
	 xZQHTB11r1Vj4TfUjKzJWbtOy7XVLYMEQzB5aF3V1bpAzrF/+/iaivfbxDIVwIagm6CsG
	 IRbykQB9wY1Gnbd2sDo5Z80/43C8iJ7RPpwpC2Hl5U5LpRRWJ0TW7jUO//lmp/ITQy0nF
	 cWm/oOfpEaxIJvMcL4etSziUR0rVmsLWzbuoFLTUrr3BU/nWuINNEd+Cu+23Ds/4RE9LW
	 JtNJpnDF3c5PlQdj94Mcv/RLSiIBA+/KpPfX/TShHbEFNUgrgi68iUGRlb7BAF7rYnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RqBqLSA5;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79DA8606A31D
	for <spacemit@lists.linux.dev>; Mon, 26 Oct 2026 05:44:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79DA8606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RqBqLSA5
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso1205800a91.1
        for <spacemit@lists.linux.dev>; Sun, 25 Oct 2026 22:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792993475; x=1793598275; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pb4KDmZUh437ZZnXb7B8ESYwa24YJGu0HgUrWTWCI2k=;
        b=RqBqLSA5TWr3xkG5tSq+nK3VgSHiL9I9HQE9wpAUFWhgn9joPIDdROCZpfRVdzrmAe
         YzoAMoXV8Fiu/fb9K9uzieBkm8BE+9nALMUdBfNAocKo/8fEIzSB+9vi3rZq3yPYoSFi
         K0LdExraBsj4CiD1EADSkFruIpOD91TXPD3WDiNihfi+kqWxOGhNR+VgxXHd/dpaCllE
         oGDMn/VAcFUZMDZhH6M17pvcOaPpnQCt7eIxL1jPeh5lCsvPs2p+g1nhd+HjAGBLVPXa
         L/O+fmWF9Oz2InUNvtcb+WbBqwySh2IO2UKg10yUtH/QyxoIaA1itNkZhStvj/QvSOV1
         FcIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792993475; x=1793598275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pb4KDmZUh437ZZnXb7B8ESYwa24YJGu0HgUrWTWCI2k=;
        b=M83iiOHqssFeCUnlKDwqPAr7rtRHF2tfk1mJ56FiH3RrtvwlbVwIynezZtMrEiH2d5
         N19YK3O7IpSNYGRBw4rsFMxbsMQlDiFbwHmYBj178dstzGtfaHrimh80O7wcPUUYeMKq
         CJ6pPDqVtdAaF05tqm6+6tV23eFU1hHno8iBX2ZRDTdOKikuMtilgFp6kkTDr2sxc+hB
         AIOjb/CIDogoBvYNEg2gaWjequdY7LgsGPXEcCWv+6O0eP1xUa4jlH3fG/iw7c1qiMqa
         XuB+vHziNQAdNh/rcxo6i/i1NRbOow/WP9ewpf/MLi438TwsFnfoO+5VSssmCWsBetSv
         3C2g==
X-Forwarded-Encrypted: i=1; AKwUvByg+JXY4IObXzFPqcQLr4hEpzCFLBkaH+700qQfb7GXmdIXKzF3leW+SzNoZ0u/ZSpaE/jI8kO7Cw==@lists.linux.dev
X-Gm-Message-State: AFq9FYJnR+dJYgeNC0kl5f/eNVt5YgV7DRfTMvBlHbXhugkmyFRmTb67
	YLHDXyCBq2xpdeLyyKbSl71Op/hRyKdCeZQvy5mqeDUoWYXs1DpWy96v
X-Gm-Gg: AYBFou2kYXdoNyGFszAywXzWKyFbLkYbI9tXRPN+z95IfQvKOSRMvRQ54DAgICgzIss
	cnNY1Rhin8CCB+/n3LSD0dkQa1/3n1Gvw6sqQM8vczAZaSNY68RUQJyhjdXgpzBOwbAJt2XT4VT
	+qTI8E+JCLYdV83KX8UhDG6ulzpUiWPB2e3jS/nejwQpEKY522RsnbPWgDaziFXMxUZCs3XTAhZ
	FaKPJfhERSKBdY+db3sQt2uBoJJ8bigMd4TQm7xVIn96A44+1CjoPbw6KUZAt8ArOOkYE2GTlwM
	4Z/rtMdaQGNhvHh9ZJEHJ2KeO9ugyCD35OleZ0dn7Zzt9a79UXKRl7kDYFYFiF9V2jjVnpfCFRX
	CPVyh7vlYSu8I57llL6o7oYQWr2Wd2gAWXlZKE3cHebUKvDN6/8ONyuy/bL3eZnqh+V1umaqJEE
	H2oeeDX2aQKJIVoiFdq3mOy5EtWDVTQsLyjneLZM7SVihCvhwNNDJaMwWr6rZQoE5jzWZ4Ubhuo
	7sJ7ATeqeI/dFxveuLEVhzXSlF9lbo7wsSC3WXcef8qiu66LZ6/ALCGxmm/KWO9WGkhhgFtueqb
	1clyviz9yluPWc0julOTaXtuh9lBN5K1UoWYGx9THWwh+MSm6iacc7Qnx2FDzZ4TFkBXnbYs0JU
	HB3QV7WIzJZGSDu7IBG4VfnCctxfDCa1t0Ik=
X-Received: by 2002:a17:90b:250:b0:3ae:2969:903f with SMTP id 98e67ed59e1d1-3ae29699194mr612839a91.45.1792993474829;
        Sun, 25 Oct 2026 22:44:34 -0700 (PDT)
Received: from alanhc-14700.tailb22ec2.ts.net (180-177-138-120.dynamic.kbronet.com.tw. [180.177.138.120])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebfa53c3sm6699893a91.13.2026.10.25.22.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 22:44:34 -0700 (PDT)
From: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
To: Anand Moon <linux.amoon@gmail.com>
Cc: dlan@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	e@freeshell.de,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] riscv: dts: spacemit: k1: mark boot-critical SoC nodes bootph-pre-ram
Date: Mon, 26 Oct 2026 13:44:27 +0800
Message-ID: <20261026054430.557499-1-alan.tseng.cs@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CANAwSgTiSiEfdLD7yUwcbFnXfRpnSNZu_GXLnQnXipc+ansnPQ@mail.gmail.com>
References: <20261024092558.143621-1-alan.tseng.cs@gmail.com> <20261024092558.143621-2-alan.tseng.cs@gmail.com> <CANAwSgQ=Djw_o89MgvEsmKVxuNiE3Yuy=e0T5DcLfqCYy6eWMw@mail.gmail.com> <20261025130206.187282-1-alan.tseng.cs@gmail.com> <CANAwSgTiSiEfdLD7yUwcbFnXfRpnSNZu_GXLnQnXipc+ansnPQ@mail.gmail.com>
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

Hi Anand,

On Mon, 26 Oct 2026 at 13:38, Anand Moon <linux.amoon@gmail.com> wrote:
> The main issue is that SPL_PINCTRL and SPL_GPIO support are required
> for board bring-up,
> but these options are currently missing from the U-Boot configuration.

Thanks for the log. You're right that the SPL can load the next stage
from a different device than the one the BootROM used. In your log the
BootROM boots from SD and the SPL then fails to find the SPI NOR,
maybe because nothing has set up those pins.

So tagging the pin groups of the boot devices makes sense to me, as
jh7110-common.dtsi does for its i2c5 pins. I'd do that once U-Boot
enables SPL_PINCTRL for K1, so that the tags have a user. It would also
go in the add-on patch rather than the BootROM one, following E's
split. PCIe and Ethernet I'd still leave out, as the SPL does not use
them.

> I am following the approach used in configs/starfive_visionfive2_defconfig
> to keep arch/riscv/dts/spacemit-k1-u-boot.dtsi as minimal and generic
> as possible,

I agree with that goal. For the regulators, I think the board files
should use the names from each board's schematic, and the SPL should
find the rails some other way than by a fixed name. Otherwise every
new board has to use the same names.

Would you like to send the U-Boot side (SPL_PINCTRL/SPL_GPIO)? I'm
happy to test it on a Milk-V Jupiter.

Thanks,
Hung-Chun
