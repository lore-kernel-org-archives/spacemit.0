Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23BA1748F
	for <spacemit@lists.linux.dev>; Wed, 24 Dec 2025 15:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766588424; cv=none; b=Y7Kd7d65u2Ek2FFCEZzhywDDxSevVI3GBS7MPytl9eBiTijLMsktWZslvfkXk/YxJ8i28YTJg0urmyOEtclv6ST2EuE8Sp127IWr91DZF96EDoeL7lBF19vNe64KGu2mXbrkBpA6yF+teDt3Qg6BcCO4RzXt+ckfMk0m/af4RuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766588424; c=relaxed/simple;
	bh=ag+Y0sBRrEuLBUiMmZ1pRl97Wh6bphgYBiUyPz7ZrCc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FLxwCp5546APnQkKPLf9kxFBi1bjHuHYB1oa8rIz9jY4CxHYJJFVZIdFAOLFx2/PbEK6N2/F9Mb6tdzohnOC+yUSH+IOX5rzVKrV1U9NkySMX818PPqqoCusdlz1XSRlIb44tU97NOiQb13/ny2k/aos3BI//KSm6q/Ew8heC1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from localhost.localdomain (unknown [116.25.94.210])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2e70ee70f;
	Wed, 24 Dec 2025 23:00:14 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: michael.opdenacker@rootcommit.com
Cc: dan.carpenter@linaro.org,
	dlan@gentoo.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: Add MMC support on BPI-F3 and OrangePi RV2
Date: Wed, 24 Dec 2025 23:00:03 +0800
Message-Id: <20251224150003.1232791-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251215-k1-boards-add-mmc-v1-2-d68dc87d4aab@rootcommit.com>
References: <20251215-k1-boards-add-mmc-v1-2-d68dc87d4aab@rootcommit.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9b50dff8cc03a2kunme7f3b4a155e5
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCH04eVkweT0geQkpIGh9MHVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk9VSUpLWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg++

Hi,

> +&sdhci0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&mmc1_cfg>;

It would be better to arrange them in alphabetical order.
(Place pinctrl below no-sdio)

> +	bus-width = <4>;
> +	cd-gpios = <&gpio K1_GPIO(80) GPIO_ACTIVE_HIGH>;

It seems that "cap-sd-highspeed" is missing?

> +	cd-inverted;
> +	no-sdio;
> +	status = "okay";
> +};

> +			sdhci0: mmc@d4280000 {

An immature idea. Would naming nodes this way be better?

sdmmc: mmc@d4280000
 sdio: mmc@d4280800
 emmc: mmc@d4281000

This seems to fit the description here better:
https://bianbu-linux.spacemit.com/en/device/peripheral_driver/SDHC/#dts-configuration

Thanks,
Chukun
