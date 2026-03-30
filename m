Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E66358384
	for <spacemit@lists.linux.dev>; Mon, 30 Mar 2026 07:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774854013; cv=none; b=kTLWiv9/wVgcBIVvOpv3sM5kLqZD1cqM2k+BYMyhmp7DhyzgiXZvsL7l8HPOq8T4IFAhCwubbzD+N45V7Z/9lHErFaqpGokOgMhgNoQKTOsyWcy40mzBU0WywkR9Ya3Ngjckqcl1LshlquIDnR8EKNPZPusMFH8Skg6Kp6hGOCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774854013; c=relaxed/simple;
	bh=rsH5whkKBpjjSZheoOnzLAEg5a8VilG60BWfcKVUReE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jc09AqnI7F0DVp87bjATkk4SbNDA5e7X3Q/rr0CevA0tiEx7Y2jfZOttkP8qapJJWPUaxit0htLU563N9PhLMI0bqu95JIk3nvELShumtGJdr8SqH5XS7U/SSP8aOI4KSRPVqfVnKX7h1rbao2lXVUzfInCwIsi4+s/FclEd7Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from localhost.localdomain (unknown [116.25.94.183])
	by smtp.qiye.163.com (Hmail) with ESMTP id 38c97798f;
	Mon, 30 Mar 2026 15:00:08 +0800 (GMT+08:00)
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
Subject: Re: [PATCH v3 3/3] riscv: dts: spacemit: Enable USB3.0/PCIe on OrangePi RV2
Date: Mon, 30 Mar 2026 15:00:01 +0800
Message-Id: <20260330070001.1920705-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <84f8e713ef1ee46f9be852f400f52d6c055725f8.1774803532.git.gaohan@iscas.ac.cn>
References: <84f8e713ef1ee46f9be852f400f52d6c055725f8.1774803532.git.gaohan@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9d3d8aed1503a2kunm3ced154046e202
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaSkJNVksZGkkZTR1OT0hDTVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk9VSkNIWVdZFhoPEhUdFFlBWU9LSFVKS0hKTkxOVUpLS1VKQk
	tLWQY+

Hi,

> +	usb3_hub_5v: regulator-usb3-hub-5v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "USB_HUB_EN";

regulator-name = "vcc5v0_usb30";
"USB_HUB_EN" is the pin name.

> +&usb_dwc3 {
> +	dr_mode = "host";
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	status = "okay";
> +
> +	hub_2_0: hub@1 {
> +		compatible = "usb5e3,610";
> +		reg = <0x1>;
> +		vdd-supply = <&usb3_hub_5v>;

This is incorrect...
The hub is powered by VCC_5V0.
VCC5V0_USB30 provides USB VBUS.

Thanks,
Chukun
