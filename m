Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA79272816
	for <spacemit@lists.linux.dev>; Fri, 23 Jan 2026 14:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769179829; cv=none; b=dFRF1RfiGpuQxLOHqOXlUsXD2SdfFjh3E7BCF3wRyyqw0Eyh6jTgyany1nu/ygqvLkfeQsIidQZoVyPKBD9uJe+s9FIpY4NNd6PyYokkin3YnPjtF03r9Ml1CliINmiBBNMO4GQqmxrtI/t0khbvcxK6AtYf3dz+qH/iPDamqnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769179829; c=relaxed/simple;
	bh=vQgq34fXXXtY7SXaVqw3lbCmJvJ09Xf94A8lTd9g8zU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IrMOpxRDRnfLGgR5dKgyyPIbt4SMQiXq8rqDL6Ule2jPgC6/icG/p5XX2UchhQdT+maOdeombkzyEI/ngTpPuTE+ruJ3750wUg5UvTGC/JY8Hjaz8Vfjxc4Ey4OYUGARGPF7oMPUqX1cb+8SRI26+xbh3hk0oDxwSd/LLDKQ6G4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from localhost.localdomain (unknown [116.25.94.62])
	by smtp.qiye.163.com (Hmail) with ESMTP id 31c3675a5;
	Fri, 23 Jan 2026 22:50:21 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: dlan@gentoo.org
Cc: alex@ghiti.fr,
	amadeus@jmu.edu.cn,
	aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robh@kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: add fixed regulators for OrangePi
Date: Fri, 23 Jan 2026 22:50:15 +0800
Message-Id: <20260123145015.1926865-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260119030251-GYD47382@gentoo.org>
References: <20260119030251-GYD47382@gentoo.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9beb55b3fa03a2kunmc924b17ad8fbd
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaQkNDVkhNQx8aTUJCSE5CTFYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk9VTUlZV1kWGg8SFR0UWUFZT0tIVUpLSUJNS0pVSktLVUtZBg
	++

Hi,

> > +	pcie_vcc3v3: regulator-pcie-vcc3v3 {
> can you follow the same name scheme with k1-bananapi-f3.dts?

Sorry, but I don't quite understand?

From fixed-regulator.yaml:
properties:
  $nodename:
    anyOf:
      - description: Preferred name is 'regulator-[0-9]v[0-9]'
        pattern: '^regulator(-[0-9]+v[0-9]+|-[0-9a-z-]+)?$'
      - description: Any name allowed
        deprecated: true

Using 'regulator-' as a prefix is correct.
There are also some commits that changed regulator nodenames. [1]

As for the regulator-name, it should be consistent with the name in
the schematics so that people can look it up between the two.
The BPI-F3 also seems to have some names [2] that need improvement:

vcc_4v     -> vcc4v0_sys
USB30_HUB  -> vcc5v0_hub
USB30_VBUS -> 5v_vbus
vin-supply    vcc5v0_sys

> also please add this regulator with explict consumer - pcie,
> otherwise I see the patch isn't really useful

I will update this in the next version.

[1] https://github.com/torvalds/linux/commit/5c96e63301978f4657c9082c55a066763c8db7b1
[2] https://drive.google.com/file/d/19iLJ5xnCB_oK8VeQjkPGjzAn39WYyylv/view?usp=sharing

Thanks,
Chukun
