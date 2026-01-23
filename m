Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675C4314D0C
	for <spacemit@lists.linux.dev>; Fri, 23 Jan 2026 14:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769177207; cv=none; b=nOs/8iRodcmv4M+BcuhvvFIAMn1OMCOkr965GNRU9hApN2CvXaicqIrCtiu1ZV1ayIGck5XasSQzNfehdElv/umS3jUlEQS/O4QIYwAaQDRysRxztda6HLE1BKcvY4lfjoECFXrhDGY/pe0kAKwAzNq5Gi1iRAsP1eKlYj8Hw1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769177207; c=relaxed/simple;
	bh=2MIvdCq9aJYMbKCo1Ko4bPEFLAU0PVh/J/H+jO2oEqM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NfDHhUvkixT7UAiiwt4wWL7NCnaILbYFCJfKVV82Q8aV4WVhG7ofR8mh381i1z4V8M6TwVJjmGkdl2XfP8SEXurzdn0bYyqGzE0yzDg1hcpmKmo7MNWxmvDxBvhin7iwpcVWpgpU5W2xWRRw2DVyNfXOVVTmDmfk7wyNHYGUr0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from localhost.localdomain (unknown [116.25.94.62])
	by smtp.qiye.163.com (Hmail) with ESMTP id 31c2ab110;
	Fri, 23 Jan 2026 22:06:36 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: dlan@gentoo.org
Cc: alex@ghiti.fr,
	amadeus@jmu.edu.cn,
	aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robh@kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 1/2] riscv: dts: spacemit: add common board dtsi for OrangePi
Date: Fri, 23 Jan 2026 22:06:25 +0800
Message-Id: <20260123140625.1918171-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260119024255-GYC47382@gentoo.org>
References: <20260119024255-GYC47382@gentoo.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9beb2da69d03a2kunm5c2622f7d671e
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDTxlNVkhDHkMeHh1DTkMaGVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk9VTUlZV1kWGg8SFR0UWUFZT0tIVUpLSUJNS0pVSktLVUtZBg
	++

Hi,

> no, as I checked these two boards having too many differences that
> I don't think it's worth trying to create a shared dtsi file

I think some of them can be shared? If you think this is inappropriate,
I will abandon this. By the way, it seems that the OrangePi R2S lacks
publicly available schematics.

Some parts are the same:
- emmc
- eeprom
- ethernet
- p1 pmic
- combo phy
- pdma / uart0
- always-on regulator
- pcie (excluding supply)
- usb2/3 (excluding supply)

Some parts are different:
- hdmi
- qspi
- sdcard
- gpio led
- sdio wifi
- audio codec
- pcie supply
- usb2/3 supply
- gpio regulator

Thanks,
Chukun
