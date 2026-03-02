Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F89383C67
	for <spacemit@lists.linux.dev>; Mon,  2 Mar 2026 07:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772435722; cv=none; b=MPnujPsmYJ2L9D3LKQuxnL078/+dukT7f7lbRqRus1PrAI4KgMzs/0tkkF+nlR3SdHuI5w21xfAa51xxSr/jIZlZ3zwWFQbnh8uw3sPMuLHgGpgTYG033O/BVvGo8gLlseNIphQGxuO9HDAgCVmfSt/HIj58GeaqkG45seYzFsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772435722; c=relaxed/simple;
	bh=2oNykpw+slA7FXC9ArkHF7ex6l48v1yHA9TpnWO2gsc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rDyUMlKON2ds+easbrQlDQ3xrtIhHFx2gw87S60g0l1Bwjk6ZsOxerCAj4xizJaI2LpwiBjYnoJBfSHPCUGefvBe3D/XFfCqUo1Rd8SFr2Dw64qLl7VXChAn6TNJPunX47CQ1qmkhC7HzPBZiEVj9fuAZWU4CyLSRuh1uwCSew8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from localhost.localdomain (unknown [58.61.141.9])
	by smtp.qiye.163.com (Hmail) with ESMTP id 35677d096;
	Mon, 2 Mar 2026 15:15:14 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: amadeus@jmu.edu.cn
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
	robh@kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 1/1] riscv: dts: spacemit: Add 'linux,pci-domain' to PCIe nodes for K1
Date: Mon,  2 Mar 2026 15:15:02 +0800
Message-Id: <20260302071502.63672-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260202100000.19176-1-amadeus@jmu.edu.cn>
References: <20260202100000.19176-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9cad66b20703a2kunmba4e2f7b7409ce
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZSh4fVhpLTUoZHk4aGUkYT1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlOQ1VNSlVKT0pVQllXWRYaDxIVHRRZQVlPS0hVSktISk5MTlVKS0tVSkJLS1
	kG

Hi,

> The SpacemiT K1 SoC has 3 PCIe EP controller nodes. Add the
> 'linux,pci-domain' property to assign a PCI domain number to
> each of the controllers instead of assigning it randomly.

Does anyone have any thoughts on this?
Without this patch, the PCI domain number is random.

```
/# find /sys/devices -name net
/sys/devices/platform/soc/soc:pcie-bus/ca800000.pcie/pci0001:00/0001:00:00.0/0001:01:00.0/net
/sys/devices/platform/soc/soc:pcie-bus/ca400000.pcie/pci0000:00/0000:00:00.0/0000:01:00.0/net

/# find /sys/devices -name net
/sys/devices/platform/soc/soc:pcie-bus/ca800000.pcie/pci0000:00/0000:00:00.0/0000:01:00.0/net
/sys/devices/platform/soc/soc:pcie-bus/ca400000.pcie/pci0001:00/0001:00:00.0/0001:01:00.0/net
```

Thanks,
Chukun
