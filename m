Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D19A33C1BE
	for <spacemit@lists.linux.dev>; Thu,  7 May 2026 06:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778136071; cv=none; b=HvQgP9SVIlXDtlhjTTBNgmhB0JrTVsRolPf8R9kRbPh2YbLQ3CH7POCl5Bh4JVDSF9HRXd4jLWoYxU74RerdcyY+7OKShnJGbn1P2E/0SMYfldEohRDc/Bal/yB3iocWrI9MogpOVdmdti2peU52PwCVrCcTtnuzXlYeMXb7pWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778136071; c=relaxed/simple;
	bh=T27QlmveSBFxRGPT1ePedOrPM/kGQ1CBhU2kFnK4fCw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tU/5LrI2HUCD5vO2g2ICuEUX68HiwaG4rUk7yiUYNRYlEu1B5tmU8TERiLo/CF17zFXqZIMD9LAZ2Dz7a4GZztK/faUJ52bo9IadJR6Q61/EIo5T0nRUNAAcul33GpBqZxbVpEI1dQjX4tuXfunqc2G8PvT/KoZzxNXl86G4TEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from Vostro-3710.. (unknown [119.122.215.211])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3d7029094;
	Thu, 7 May 2026 14:40:55 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: linux.amoon@gmail.com
Cc: alex@ghiti.fr,
	amadeus@jmu.edu.cn,
	aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dlan@kernel.org,
	gaohan@iscas.ac.cn,
	huang.ze@linux.dev,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robh@kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v2 2/4] riscv: dts: spacemit: k1-bananapi-f3: Update USB regulator on onboard usb and label
Date: Thu,  7 May 2026 14:40:50 +0800
Message-Id: <20260507064050.1881348-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260502051906.8160-3-linux.amoon@gmail.com>
References: <20260502051906.8160-3-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e012afe1e03a2kunm6dfa036b197e03
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCH0tDVkxJThodSk1OQkpITFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKSkJVSklJVUlKTlVJSkpZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pOTE5VSktLVUpCS0tZBg++

Hi,

> @@ -366,7 +366,7 @@ &usb_dwc3 {
>  	hub_2_0: hub@1 {
>  		compatible = "usb2109,2817";
>  		reg = <0x1>;
> -		vdd-supply = <&usb3_hub_5v>;
> +		vdd-supply = <&reg_5v_vbus>;
>  		peer-hub = <&hub_3_0>;
>  		reset-gpios = <&gpio K1_GPIO(124) GPIO_ACTIVE_LOW>;
>  	};
> @@ -374,7 +374,7 @@ hub_2_0: hub@1 {
>  	hub_3_0: hub@2 {
>  		compatible = "usb2109,817";
>  		reg = <0x2>;
> -		vdd-supply = <&usb3_hub_5v>;
> +		vdd-supply = <&reg_5v_vbus>;
>  		peer-hub = <&hub_2_0>;
>  		reset-gpios = <&gpio K1_GPIO(124) GPIO_ACTIVE_LOW>;
>  	};

This is incorrect. The hub is powered by vcc5v0_hub. According
to the schematic, 5v_vbus provides the VBUS for the USB3 ports.
