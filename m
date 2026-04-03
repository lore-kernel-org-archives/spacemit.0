Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B593B226863
	for <spacemit@lists.linux.dev>; Fri,  3 Apr 2026 09:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775209260; cv=none; b=bf//D8zRPMu6uOYZawhvUTSGj0qnAZbcR11ykkNKYZWvr4cdyfwh2ejtcU//L1+Nhxg+b7vwX3S9bKGk47Sv3CR9L/RuRXWqpXoQHg/eILX+WHqKu8WOZI9Cdi2irhz+IM+ms0fmuayZ82WDAgmcvIlJP0/PMqbg180jaNAerD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775209260; c=relaxed/simple;
	bh=AiBtAdXx3VegFtcSRwvWQvA36OGNPCVim7p8JFQ7feg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=M+MFXp5um7Wa+EQfTS/35ZpVQPo24saJbLe5g8YonTJfx410QZ6Nh98PsyHoY1JUO8rHX25B88KU8jdyCkrqV+ngoFu7bRqBgHHBFHNkPYk433QZ6w43dagYR0g/yptRkUoax+U5SGhDUpUjzCwv1M6DGls9ei1n9O+k3mVcAnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from localhost.localdomain (unknown [116.25.95.185])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3972f1899;
	Fri, 3 Apr 2026 17:40:53 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: gaohan@iscas.ac.cn
Cc: alex@ghiti.fr,
	amadeus@jmu.edu.cn,
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
	spacemit@lists.linux.dev
Subject: Re: [PATCH v5 2/3] riscv: dts: spacemit: Define the P1 PMIC regulators for OrangePi RV2
Date: Fri,  3 Apr 2026 17:40:21 +0800
Message-Id: <20260403094021.229838-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <6376799689e094253fb1dc0e3e27b491be46e9db.1775148159.git.gaohan@iscas.ac.cn>
References: <6376799689e094253fb1dc0e3e27b491be46e9db.1775148159.git.gaohan@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9d52b78a2e03a2kunma4e3e7aa59b1ed
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDGh9DVh5NTB9IQh5NS08dHlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk5VSkNOWVdZFhoPEhUdFFlBWU9LSFVKS0hKTkxOVUpLS1VKQk
	tLWQY+

Hi,

> @@ -91,6 +110,94 @@ &i2c8 {
>  	pinctrl-0 = <&i2c8_cfg>;
>  	pinctrl-names = "default";
>  	status = "okay";

Perhaps the previous i2c8 enabling patch could be merged with this one.
For the floating sections, I suggest marking them as "not connected":

```
		regulators {
			buck1 {
				regulator-min-microvolt = <500000>;
				regulator-max-microvolt = <3450000>;
				regulator-ramp-delay = <5000>;
				regulator-always-on;
			};

			buck2 {
				regulator-min-microvolt = <500000>;
				regulator-max-microvolt = <3450000>;
				regulator-ramp-delay = <5000>;
				regulator-always-on;
			};

			buck3_1v8: buck3 {
				regulator-min-microvolt = <500000>;
				regulator-max-microvolt = <1800000>;
				regulator-ramp-delay = <5000>;
				regulator-always-on;
			};

			buck4_3v3: buck4 {
				regulator-min-microvolt = <500000>;
				regulator-max-microvolt = <3300000>;
				regulator-ramp-delay = <5000>;
				regulator-always-on;
			};

			buck5: buck5 {
				regulator-min-microvolt = <500000>;
				regulator-max-microvolt = <3450000>;
				regulator-ramp-delay = <5000>;
				regulator-always-on;
			};

			buck6 {
				regulator-min-microvolt = <500000>;
				regulator-max-microvolt = <3450000>;
				regulator-ramp-delay = <5000>;
				regulator-always-on;
			};

			aldo1 {
				regulator-min-microvolt = <500000>;
				regulator-max-microvolt = <3400000>;
				regulator-boot-on;
			};

			aldo2 {
				/* not connected */
			};

			aldo3 {
				/* not connected */
			};

			aldo4 {
				/* not connected */
			};

			dldo1 {
				regulator-min-microvolt = <500000>;
				regulator-max-microvolt = <3400000>;
				regulator-boot-on;
			};

			dldo2 {
				/* not connected */
			};

			dldo3 {
				/* not connected */
			};

			dldo4 {
				regulator-min-microvolt = <500000>;
				regulator-max-microvolt = <3400000>;
				regulator-always-on;
			};

			dldo5 {
				regulator-min-microvolt = <500000>;
				regulator-max-microvolt = <3400000>;
			};

			dldo6 {
				regulator-min-microvolt = <500000>;
				regulator-max-microvolt = <3400000>;
				regulator-always-on;
			};

			dldo7 {
				/* not connected */
			};
		};
```

Thanks,
Chukun
