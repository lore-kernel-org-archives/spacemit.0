Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A6F22D785
	for <spacemit@lists.linux.dev>; Sat, 14 Mar 2026 08:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773475223; cv=none; b=bU+/arSYT0xXCWezda/5gQ+8nDuRWHPQd9vB+fS+XoTSXwnFdi3T7Vt1RgPgQ9IZOlkwpgmWIy5/7Xq0N40Qfavk6B2HNmbkEmFof2mJ0CnzgUZ43CxdYVQfFb34sQ5zJ2FuXE2WdZDsFaENHDzMlcIGe1Iqp0diG6FNj/0FsWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773475223; c=relaxed/simple;
	bh=7cXL1x9VDDJYAcnzsSdDGWEjIgHPn15oz2mI6DIi1Bg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=K/OCWsqboHK+PP4k1IDZlFAAkd9emkNfL394p2cp99MNyhitygnxI5FDvkrKK84DbP4t6nHSipNQKWPjcBdKEoJN75yGPV1EP6U5Vq93fxFKsFwMvso6Epqq/uC9zJncHYuQISjFc+Qf7yZmghCqlOHvmq3x9okB5bxD0BDfw0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from Vostro-3710.lan (unknown [116.25.94.199])
	by smtp.qiye.163.com (Hmail) with ESMTP id 36eefd5cf;
	Sat, 14 Mar 2026 16:00:12 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: gaohan@iscas.ac.cn
Cc: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dlan@kernel.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	rabenda.cn@gmail.com,
	robh@kernel.org,
	spacemit@lists.linux.dev,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: Re: [PATCH v2 4/4] riscv: dts: spacemit: Enable USB3.0/PCIe on OrangePi RV2
Date: Sat, 14 Mar 2026 16:00:03 +0800
Message-Id: <20260314080003.2573296-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260310161853.3900605-5-gaohan@iscas.ac.cn>
References: <20260310161853.3900605-5-gaohan@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9ceb5c2ad603a2kunmb13d530a73040
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDTh5MVk8aGhgaQk8fHRlPGlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk9VSkJCWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09LVUpLS1VLWQ
	Y+

Hi,

> +	regulator-usb3-vbus-5v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "USB30_VBUS";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		gpio = <&gpio K1_GPIO(97) GPIO_ACTIVE_HIGH>;

Is this true?

> +		enable-active-high;
> +	};
> +
> +	usb3_hub_5v: regulator-usb3-hub-5v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "USB30_HUB";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		gpio = <&gpio K1_GPIO(123) GPIO_ACTIVE_HIGH>;

Although GPIO123 is labeled as USB_HUB_EN, it actually
supplies for USB3 vbus.

> +		enable-active-high;
> +	};

> ...
> +		peer-hub = <&hub_3_0>;
> +		reset-gpios = <&gpio K1_GPIO(124) GPIO_ACTIVE_LOW>;

Really? GPIO124 is floating.

> +	};

I still insist that the regulator name of DT should be the same
as on the schematic. This will force us to review the schematic.

Thanks,
Chukun
