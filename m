Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B73724E4C6
	for <spacemit@lists.linux.dev>; Thu,  7 May 2026 07:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778137561; cv=none; b=kw5s6rWb4iAPLY2jdLk2Y0yxigaWVip/zk1GpBgjqZaGoEBkWIcXP0MyGylW+AzI0ox6pxvlQaUUXGeaMsKee4YXqXosq6tRW9VXlW/MDKZiDWC5Ej1QuAONPUluKcHKULz+BWNeqQauAHounUukQNbugbEKWCUyEZ6EPS9FfEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778137561; c=relaxed/simple;
	bh=Zgs20AJ1aIWSlJgsXvtQl8XF8EIm0oHc5I/Q4rYaeIg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lU8UWGZC5b944oFGyKHhjX3UjexPmzHiPhrGmYUR2cmHMscrT6n9nIsE4VH3bDhGD+CsP4ko9AvZWdnMvp3kMqZT7pb8wVXeeuzIe0Pi2w5YM0gAQlhTnWMV8+CLXvw2IxzyXWnVsjT2ZjJvopfD1dDRTv57NugR53UkkpnokBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from Vostro-3710.. (unknown [119.122.215.211])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3d702923a;
	Thu, 7 May 2026 14:50:35 +0800 (GMT+08:00)
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
Subject: Re: [PATCH v2 4/4] riscv: dts: spacemit: k1-bananapi-f3: Add vin-supply for PCIe 3.3V regulator
Date: Thu,  7 May 2026 14:50:30 +0800
Message-Id: <20260507065030.1883988-1-amadeus@jmu.edu.cn>
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
X-HM-Tid: 0a9e0133d8ae03a2kunmf8576bae198421
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCSBhNVh5KQk5IS01CTxkYTlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKSkJVSklJVUlKTlVJSkpZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pOTE5VSktLVUpCS0tZBg++

Hi,

> @@ -39,6 +39,7 @@ pcie_vcc_3v3: regulator-pcie-vcc3v3 {
>  		regulator-min-microvolt = <3300000>;
>  		regulator-max-microvolt = <3300000>;
>  		regulator-always-on;
> +		vin-supply = <&reg_vcc5v0_sys>;
>  	};

This is incorrect. pcie_vcc3v3 is driven by usbvbus (dc_in).
