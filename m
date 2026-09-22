Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D45211466
	for <spacemit@lists.linux.dev>; Tue, 22 Sep 2026 06:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790059815; cv=none; b=bfOIYKTVxD5uP7Q6u17JaU6A2gdGUzdkcYPQMBv3ZP6xLvYCxxuOCttI3zLKymv+DtDhf35V9wlYu7HjxQgUOE54Nqd+fHH6JDdXu8gaeIG9SZ9tyXK7wkBNSP6PhhKCXnNGwUOMlFH4cDlJuj6BjGLulUXD4y2xeLrFW1vHHNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790059815; c=relaxed/simple;
	bh=KyPkuLmmMKTjvDOFGsw8Mq7P9vKr0nZHryZUUHgxshQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QZbnN5xL0uQQfiemIj8wNtlLqkaSVa8Lb5nMiYbvi8EBmGFs9EPZTghi3D8lUJCaikdIAlDRDtCkQYbv/c4JIV7hu3Gc11K9qcfPedv5Qccnhr19QtJNsekiesCDgvJ0PXS2hSdw/lzR/IyTrxWoVGo4yDejOEvpaMwFjJHaQxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from Vostro-3710.. (unknown [14.220.232.127])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4eaf44e16;
	Tue, 22 Sep 2026 14:50:07 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: dlan@kernel.org
Cc: alex@ghiti.fr,
	amadeus@jmu.edu.cn,
	aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robh@kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 1/1] riscv: dts: spacemit: set ETH MAC from eeprom for OrangePi
Date: Tue, 22 Sep 2026 14:50:01 +0800
Message-Id: <20260922065001.1888961-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260921124206-GKI297024@kernel.org>
References: <20260921124206-GKI297024@kernel.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa0c7e1019503a2kunmdae442db36297
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCHktNVh5CH0JIHh9OH0tPGlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKT1VJSUtVSUhJVUpJTFlXWRYaDxIVHRRZQVlPS0hVQkJJTk
	tVSktLVUpCS0JZBg++

Hi,

> Could you point me where the u-boot patching the MAC address?
> I'm not fully aware of this problem..

This is handled by U-Boot's fdt_fixup_ethernet() function:
https://github.com/u-boot/u-boot/blob/main/boot/fdt_support.c#L639

do_bootm_linux()
        |
boot_prep_linux()
        |
image_setup_linux()
        |
image_setup_libfdt()
        |
fdt_fixup_ethernet()

Thanks,
Chukun
