Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D5D34104B
	for <spacemit@lists.linux.dev>; Thu,  7 May 2026 06:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778136927; cv=none; b=aFWd7NlzJM8Rprxu0LgLUV+UH9WTfk4S/KVD+7/f3QPKkue4JRrfT2Csc8a6eF+v/1Vw7DCtyaLpeVCpbp5NZ7EHQwJmGceHxGdkyCKyZswa1pOtiHcEh1ZVas31wycRVjLseEL+7WICMYlUQ9ZS6lahDvDTtq6gFBF78f46XIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778136927; c=relaxed/simple;
	bh=xRQzefjZDSutd5Xd5WSrMKEfveXiEhWRhN5BByEGscQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UNDDTXe8R3qdN5ZpLV32MAfgO4SmK6nUTuMbmGL6SiI59+C4+4MfUJ3BLjF5VUgEeO041xU82CipnHqb2nHEgVOii0A3CRAwua2X3tHbVb0Tv92MVe/iXhdajJAUkb/vJw32S85wCu46GqKZCfoCd69Ew2wLUN0wym4HjNISmsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from Vostro-3710.. (unknown [119.122.215.211])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3d7029228;
	Thu, 7 May 2026 14:50:10 +0800 (GMT+08:00)
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
Subject: Re: [PATCH v2 3/4] riscv: dts: spacemit: k1-bananapi-f3: Correct USB hub power hierarchy
Date: Thu,  7 May 2026 14:50:02 +0800
Message-Id: <20260507065002.1883127-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260502051906.8160-4-linux.amoon@gmail.com>
References: <20260502051906.8160-4-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e0133775103a2kunmfaa00f951983c8
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDGB5MVhpOSE9PHUlLSE0fT1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKSkJVSklJVUlKTlVJSkpZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0tVSktLVUtZBg++

Hi,

>  	usb3_hub_5v: regulator-usb3-hub-5v {
>  		compatible = "regulator-fixed";
> -		regulator-name = "USB30_HUB";
> +		regulator-name = "VCC5V0_HUB";

Suggested changes:
	vcc5v0_hub: regulator-vcc5v0-hub {
		compatible = "regulator-fixed";
		regulator-name = "vcc5v0_hub";

>  		regulator-min-microvolt = <5000000>;
>  		regulator-max-microvolt = <5000000>;
> +		regulator-always-on;

Why always on?

> @@ -361,6 +362,7 @@ &usb_dwc3 {
>  	dr_mode = "host";
>  	#address-cells = <1>;
>  	#size-cells = <0>;
> +	vbus-supply = <&usb3_hub_5v>;
>  	status = "okay";

This is incorrect. See the previous reply.
