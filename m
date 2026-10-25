Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792933333;
	b=RTBTzui8EFiOOkZ1ivgPUMNFJHqmp1oLNFlMTQZNfLr1oGNNnxFdUxDJMy7IXPxxeGVM
	 09Dm3b1bp0RmDD+E6Im/E82XgBH1MwlTmQixTE5+6wqhZxUV1pu3Kr6ruYES6Vz2OvFyx
	 bQZyaS0d8QZZ8NOTjJ3QS/agH5dSqvcnpQFu2kvMthsvHFV4GDWiYL+qo44Hj3E4h47kM
	 xUcNCpVhwJvVzhWlH7mswNV4w3oTxjdWrXGv7AaxShm6JhfP8IgYIJ0ETIdK+nSJEnxKG
	 zPFvJ1SFAp0dhxBRJ1+HVmix0w+RbbrKd4w8L3kGjU8izgWOWhRbAhOz+8KbfvTRjMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792933333;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BeWhtqurdRURXZzZxthQRkSgg7DOPSB9+FM4Irtz//w=;
	b=3zHaMfvw3QY3P6MFj3ivL0loE1C0UERJjy86h6VesUq/imbXOwh4cY2S/GQeKTV96Szp
	 2hBt6FJFcWzidP9noFAASsE5pYOdbFodqFiJhigQ39jXYTt5S89sHMHRhyZnHbz0sq8pX
	 uD/m6evgumPrTiJ/BejC7UAg3vR5bbEFEsCSjiF4Ys4wdLP5Oyjmgl7v+rg5krozbPrAb
	 /cnvyaVHGV29zHd1uNkl6D1WVtMgmnOAXyU06XMZzspTbLYP7xbIqk32z83U9CvmrWSRX
	 TVr+SGQ/LO0zQVNvwWvzRjyg1Yvycheen+F6gKGMAW+DtA0RHgWz5eKj7xMFej5qkVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=d7u8J66g;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B572606A31A
	for <spacemit@lists.linux.dev>; Sun, 25 Oct 2026 13:02:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B572606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=d7u8J66g
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e9cf928dc9so14886465ad.0
        for <spacemit@lists.linux.dev>; Sun, 25 Oct 2026 06:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792933333; x=1793538133; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BeWhtqurdRURXZzZxthQRkSgg7DOPSB9+FM4Irtz//w=;
        b=d7u8J66g2AbUnYiAso+9sQ2gMZL3HOW0O3egoNC64dUZfe+IqbVyyF4bdcDwBIrU52
         84Vitq0JjzYIrL425ZQZx6oKs8yYcw7goQkRPkBjVsIF2wDJY8d96iL1LUUhaOP8Xjgy
         7S2qp3JMHnZpbZ4+fqdkALyw5kiJSfSHVcEbVhs2w6EQdYlXoo/cIluaJzYeSs14UkQo
         W9nZSuB3XsdcAW8bDt34P3rW3msg8mI/cmC6coue4ejQc2yFFmN9AZ2yHGCi+Lb3RG+t
         s/IFI5ACO5gFB2vIReqq4ACzyb+q8Vr96ciflwSFNvo4LsKK7eHF6+88Tl1NFxC+d+Xb
         +4nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792933333; x=1793538133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BeWhtqurdRURXZzZxthQRkSgg7DOPSB9+FM4Irtz//w=;
        b=GKunjwWCHVl83j0ewYD47wEfeEj3mRXd9WF62U8MG+qxx/lTxp/8Vgc5M51TiAuHGc
         tpiTsPB2qIMPvJPKkEn7rVNs/BgCa5eF5a8xeUErI6snpmyEY1uRriZC0gYDAvfl838B
         75lP3h5+LzYkhzgfPHXUT+YNxtUi3ODKe6xrXmTPP2tN2/CTVFkIczadusHWCK+0oTqV
         QLfYsUublOEebcLj58Vllo2IiWLDJ+65wgHwmQWTjlfxYKBf8j1FJfvc7+eChg4FtkEs
         voGEG+11qOwgxU5sX3vNGI9MIRvQAUT9Jr2PJClAeKbXZXhD2grhAGICkaA//q6m77LC
         PopQ==
X-Forwarded-Encrypted: i=1; AKwUvByvBPuwWMxdf4rO9wpf/vD6rnWhibGbIuItIctNcqkCmxHKGnIPqc4rX0ZPGtDlzrFk2pwITeldXw==@lists.linux.dev
X-Gm-Message-State: AFq9FYL6gVb8p8ccHF3UaYkax6GnDqYE0j5oWPJPHPIVZXeP3G+3osTF
	h0Nwr8bupz/utRPaS37J4wamPeecYDfVxhvm+QR1L87O3bTr4fDi3wJc
X-Gm-Gg: AYBFou0qrxrmd1ycWuzTvDZw3m51NreDEK9qMyiazQqR5OBj7Tk5QC47rrw8uiiiLpi
	FG+M0NfNGuruQlAfXcGDM5E6a5QSdzBv+2oceNTPgGn/M5UzApLKmE+1kbLlNgjmc6YXcsTdjLO
	bQEbgqmTaQC5n3fbAmNCq6L4zAhtYjbVHU5PcxJdClagdkhvpI04R77fyrq2z3iJGvj4ppmfheB
	pHrkvi1PvJ5+LovZ3DddoQtAfshPMb18xKYOwdB0hfy+kOjvHUMumBWhUVCYaXAOe93Ia4cJ6IF
	T8lbMWRnei1AY1cMOrIzJDphn3WoQycY/Gq7AolWDqsr+mdE8hBeZv/bSyxBBH8r3AAga+NJp25
	N2ES1AgZNoo8dogeJcsMl2GQRLD4G1AilANHFVHTMf/FbKGQu+B5uTzN0gWtHrNSWGrQiwo0VaL
	7O1tc5pqZb7gEr1Mz4CjXDi0HuU5rj6VCgkS/DjoMLdrU0f1AlqsUoJGTd+xGi16+xaDUHuLyQd
	+TZNnvgshf42AiU1KtDsPE7QAanAtR3f5wgojw8VSvE/X4ZQnyIusGIOumyW1okq2bTouV7fXZf
	QdV/qQOffwf7Q5b5H3a5Rhgqe5dUGJ5PBeAmBrlTRp0Vv60TKK2f7IeJzFUiNkVY9N0wqry23Hc
	x52oN24Y13m8L3H4SnRh+Rc45gNZqIWLrtzJs4vSbdqyVg/GGfef0ulZ2KA==
X-Received: by 2002:a17:903:198e:b0:2e5:41d6:178c with SMTP id d9443c01a7336-2ea9cc5802emr27275065ad.33.1792933332318;
        Sun, 25 Oct 2026 06:02:12 -0700 (PDT)
Received: from alanhc-14700.tailb22ec2.ts.net (180-177-138-120.dynamic.kbronet.com.tw. [180.177.138.120])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b14d1ddsm8430055ad.40.2026.10.25.06.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 06:02:11 -0700 (PDT)
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
Date: Sun, 25 Oct 2026 21:02:04 +0800
Message-ID: <20261025130206.187282-1-alan.tseng.cs@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CANAwSgQ=Djw_o89MgvEsmKVxuNiE3Yuy=e0T5DcLfqCYy6eWMw@mail.gmail.com>
References: <20261024092558.143621-1-alan.tseng.cs@gmail.com> <20261024092558.143621-2-alan.tseng.cs@gmail.com> <CANAwSgQ=Djw_o89MgvEsmKVxuNiE3Yuy=e0T5DcLfqCYy6eWMw@mail.gmail.com>
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

On Sun, 25 Oct 2026 at 18:43, Anand Moon <linux.amoon@gmail.com> wrote:
> Could you update the pinctrl and GPIO configurations, including all
> necessary pin
> assignments, to bring up the SD card, PCIe, and Ethernet nodes?
>
> Please ensure that the required bootph-pre-ram properties are applied
> to the relevant
> pinctrl, GPIO, and other dependent nodes wherever necessary for SD card boot and
> SPL initialization.

I'd like to keep this series to what is needed before DRAM is up.
PCIe and Ethernet are not used in that phase, and their pinctrl-0
entries are already in the board files.

For the boot media, the BootROM has already set up the pins of the
device it loaded the SPL from. U-Boot's spacemit_k1_defconfig does
not enable SPL_PINCTRL or SPL_GPIO either, so the tags would have no
user today. SD boot on a Milk-V Jupiter works without them.

E also asked on the cover letter to keep the BootROM part and the DRAM
part apart, so I'd rather not widen it.

> Additionally, could you update the regulator-name properties for
> vdd_core, vdd_1v8,
> and vdd_1v8_mmc?  On all the boards, the SPL code requires these regulator names
> to locate and enable the corresponding regulators during early boot.

These names come from the U-Boot SPL code, not from the board
schematics, and U-Boot already sets them in
arch/riscv/dts/k1-bananapi-f3-u-boot.dtsi and k1-musepi-pro-u-boot.dtsi.
I think that is the right place for them.

> I am verifying the changes against the existing U-Boot board device
> tree and configuration to ensure
> that SD card, eMMC, PCIe, and Ethernet initialization work correctly.

Thanks for testing. Please let me know how it goes.

Thanks,
Hung-Chun
