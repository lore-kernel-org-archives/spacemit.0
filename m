Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256A035CB63
	for <spacemit@lists.linux.dev>; Wed,  4 Feb 2026 14:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770214000; cv=none; b=LxAXXPNbU2bbAgqn++oXCUb0Pua4PzsU1g0BumhB+IIxK++XVM94sSP3+SklxpeAgOMtOKelhxrbK5n3mCUahm1fD9gVLZJNgovVcI5jLFpvI/zyDfjuA8k82QWQ4HfM1xmsc+84R/2aP0Fctzv/9+JAUu6UGBu5yqu4FyS9pXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770214000; c=relaxed/simple;
	bh=2a2PMz2CFcrYVLKAbwKwcC1JAadEDzIjkq2ccEeYotQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YnFXW/OHs/Q7yk+ZYUw6+No1OtfUelQGzW7/s/QWNl5ecZC4yPeEM4jdzGhbRawD7xFwrsdxT2oYBbhrlGz+8HPDKcFEATOLiLC8rY8zKxY+BijJiZIvQsjMGg83tw0MSfluLD+zSvGarAvOp97EkIxCKp/ljH2uXzLzhR0hiV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from localhost.localdomain (unknown [58.61.141.99])
	by smtp.qiye.163.com (Hmail) with ESMTP id 331d6ec47;
	Wed, 4 Feb 2026 22:06:34 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: gaohan@iscas.ac.cn
Cc: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dlan@gentoo.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	rabenda.cn@gmail.com,
	robh@kernel.org,
	spacemit@lists.linux.dev,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: Re: [PATCH 7/7] riscv: dts: spacemit: PCIe and PHY-related updates for OrangePi RV2
Date: Wed,  4 Feb 2026 22:06:19 +0800
Message-Id: <20260204140619.47536-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <677085181a4215c517907f44b363ef7777fd407b.1769895215.git.gaohan@iscas.ac.cn>
References: <677085181a4215c517907f44b363ef7777fd407b.1769895215.git.gaohan@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9c28f9f01d03a2kunmc61284e02ceb56
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCGEIdVk9KGUpKSh5MTUhDGVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlOQ1VNSlVKT0pVQkJZV1kWGg8SFR0UWUFZT0tIVUpLSElNT0JVSktLVUpCS0
	tZBg++

Hi,

> +&combo_phy {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pcie0_3_cfg>;
> +};

This pinctrl is clearly incorrect (including BPI-F3).
Checking the schematic reveals that these pins are for CAM_I2C.
By the way, combo_phy connects to USB3, so it should be enabled
in the USB3 patch.

Thanks,
Chukun
