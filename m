Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBDC1A9FB0
	for <spacemit@lists.linux.dev>; Thu, 19 Mar 2026 06:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773901582; cv=none; b=WB+y4Y/z0NOJe0jR08IitvQDSzNqXQfmFE29Pp0OC+D2kiSYmKLLd2qe+tms8b1ZijTCpPT9frG5lFuJ6KklO6xy8nNEXXybj8eqNjaxRw1XllFj6JpOxQYW613COb9FXCKfN5Q5jfwn0H2yCPytQW7DXilEjnfrgr2rx2S/KlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773901582; c=relaxed/simple;
	bh=21xww1wUtJxyoss2A64Nh+1RNmAWHYGyqiWGeKGa+Yg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MYNXnnUdICfAclBgGMOw1ei14Ew0f1pY8xeSjzDo3/4GY/cIcj4tw/f2E8Q70LuvcWLB2Xgpxv5Ffqx/ZySkb1OO9GqGsdWuLy5fMVbxVK4uPjd8yVhgpnX7QdlsKA8+hbkwH4DGQBJ+4zyL/mgYAPSx1HnsNHJKvOxHsdHWVrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from localhost.localdomain (unknown [116.25.95.187])
	by smtp.qiye.163.com (Hmail) with ESMTP id 378652ffb;
	Thu, 19 Mar 2026 14:26:10 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: thinh.nguyen@synopsys.com
Cc: amadeus@jmu.edu.cn,
	dlan@kernel.org,
	gregkh@linuxfoundation.org,
	huang.ze@linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-usb@vger.kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 1/1] usb: dwc3: dwc3-generic-plat: Add optional VBUS regulator support
Date: Thu, 19 Mar 2026 14:26:01 +0800
Message-Id: <20260319062601.1042965-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260318231542.mmbcrqy36oyw44xc@synopsys.com>
References: <20260318231542.mmbcrqy36oyw44xc@synopsys.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9d04c5e12303a2kunm33e6bd551ad55b
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaTkkeVkxPHkMeSUxPSksdTlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk5VSkNMWVdZFhoPEhUdFFlBWU9LSFVKS0lCTUtKVUpLS1VLWQ
	Y+

Hi,

> I mean this is a generic glue driver and not specific to your spacemit
> k1. Some platforms use regulators to drive the vbus (e.g. dwc3 meson)
> while others for internal controller supplies (e.g. dwc3 exynos). Also,

So shouldn't the generic glue driver manage vbus, but rather the Spacemit
USB PHY driver? I don't have any good ideas about the current name.

> if the platform is operating in device mode, there should be no vbus.

Do I need to check if it's in host mode?

> Also do we want to disable the regulator on system suspend? If so, we
> may need a regulator handle.

I'll add it if you think it's necessary.

I'm not quite sure how to do it well, thank
you for taking the time to review.

Thanks,
Chukun
