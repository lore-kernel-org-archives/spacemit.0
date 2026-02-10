Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D0B2D24B7
	for <spacemit@lists.linux.dev>; Tue, 10 Feb 2026 07:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770706829; cv=none; b=lkLzjXO+NpwpXb+cYxjOuAeUd8ZtpaXOETVc9mYygfAdX5ApiUI11DFBueCTOZkzfUMy2bWU0SG7JC1nntYkxneA7EsI1aQldqv5PgC5gp1sR2iDWWdJsQuXlcHaYVlzSYUB0Nzas9W/hojNRs0jpRIlOs2WWBSHNcu8LH2fR5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770706829; c=relaxed/simple;
	bh=D3kEAEt3N6vKWz4crcjlxWDxne0p0vAcw3BldFPSjrc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=huD5yTRVTgbsdX56AWGEenhkRyjaHcqzeV8s1KAzkYFqHTqbQ03GwKVOfbpYxLwZcpSuZpJBGuNCBRPI5KEXdxiRBrUbCByZqAILntny51G2vx6Vnfgl+elLkfIt1Nrhc6IBjEF+tuOM8TWcuLehyRyRhGM3IEyMTFbUMHOt2ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from localhost.localdomain (unknown [58.61.141.99])
	by smtp.qiye.163.com (Hmail) with ESMTP id 33b43ff1f;
	Tue, 10 Feb 2026 15:00:16 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: huang.ze@linux.dev
Cc: amadeus@jmu.edu.cn,
	broonie@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dlan@kernel.org,
	krzk+dt@kernel.org,
	krzk@kernel.org,
	lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	neil.armstrong@linaro.org,
	robh@kernel.org,
	spacemit@lists.linux.dev,
	vkoul@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: phy: spacemit: add regulator support to K1 USB2 PHY
Date: Tue, 10 Feb 2026 15:00:09 +0800
Message-Id: <20260210070009.46040-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <DGB1P3K6I14J.1QCMDY84ZR7ZH@linux.dev>
References: <DGB1P3K6I14J.1QCMDY84ZR7ZH@linux.dev>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9c4659ce3303a2kunm2c116fa0524a63
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaT0wYVhlLHh9MH0IYHUtLTFYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlOQ1VNSlVKT0pVQkJZV1kWGg8SFR0UWUFZT0tIVUpLSUJNS0pVSktLVUtZBg
	++

Hi,

> > It appears Ze Huang described the vbus-supply property in
> > spacemit.k1-dwc3.yaml.
> >
> > So I should enable the regulator in the dwc3-generic-plat driver.
>
> No, we will enable regulator at port level.

Since dt-bindings (spacemit.k1-dwc3.yaml) already describes the
vbus-supply property, why can't it be implemented in the dwc3 driver?

> Previously, the VBUS regulator was defined as regulator-always-on
> in the device tree as a workaround.

I don't like this workaround because we can control the VBUS regulator
through the USB PHY driver or the USB Controller driver. These are widely
implemented in other similar drivers.

Regarding port level, few manufacturers use different VBUS supplies
for the ports coming out of the USB hub, such as the ArmSoM Sige1 board.
Most boards use the same VBUS for a single USB socket, so I don't quite
understand why we need to wait for port level implementation.

Thanks,
Chukun
