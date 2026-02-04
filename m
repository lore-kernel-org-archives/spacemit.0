Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83A03FCC
	for <spacemit@lists.linux.dev>; Wed,  4 Feb 2026 13:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770213052; cv=none; b=ffYGbIgkDeVHcEjjhiYfUhQwuzNUEaUcRcqkyPlsgbShz8M4pQ0dpiF3EHharJWDBhRdTsFVTzNAOUridJFBoSAwB+vzZV7cFLtddyhMFYwqgEZZtu455VEcyfkPhQebhAlvM5C7wS5ehhiX4uxWS+WRGSZ+cjwZVj3Q5csxZqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770213052; c=relaxed/simple;
	bh=xitmTmGAAonTDXN69XG9IOGiJdiwHFKwebawf0o34HA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sHBTZb2+TzA5huxkeTtVH2Uj40w4s6KWxYG8wR59b3+5aUfLVl59H4cuqJdt0R1MFjfk47I7SSHo7DCwwSRiU0L52zQeniF9evdii85LpnU8YD18JDFbfzvamg6XZoNNM0lv+NLiTTll3KxFXxWVRIUwjxl3ClXEaGiTKVkRsX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from localhost.localdomain (unknown [58.61.141.99])
	by smtp.qiye.163.com (Hmail) with ESMTP id 331d2b19c;
	Wed, 4 Feb 2026 21:50:41 +0800 (GMT+08:00)
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
Subject: Re: [PATCH 6/7] riscv: dts: spacemit: Add a PCIe regulator for OrangePi RV2
Date: Wed,  4 Feb 2026 21:50:32 +0800
Message-Id: <20260204135032.46172-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <fbeb8b9f1c3453cb6907247aecbf62675d2e9de9.1769895215.git.gaohan@iscas.ac.cn>
References: <fbeb8b9f1c3453cb6907247aecbf62675d2e9de9.1769895215.git.gaohan@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9c28eb639203a2kunm98d059402ccf93
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDGE5JVkNIHRoaGU5DTRpNTVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlOQ1VNSlVKT0pVQkJZV1kWGg8SFR0UWUFZT0tIVUpLSUJNSEpVSktLVUtZBg
	++

Hi,

> Define a 3.3v fixed voltage regulator to be used by PCIe on the
> OrangePi RV2. On this platform, this regulator is always on.

(...)

> +		regulator-always-on;
> +		gpio = <&gpio K1_GPIO(116) GPIO_ACTIVE_HIGH>;

Why is this regulator always on?
It is clearly controlled by gpio.

Thanks,
Chukun
