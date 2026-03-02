Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37EFA15539A
	for <spacemit@lists.linux.dev>; Mon,  2 Mar 2026 03:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772421035; cv=none; b=eYG05Lnctd+x6M+I9doBZnV5iOxETWoVNAfue3r4BH9jYcHxBax2Pwa5DG3o18vI2fng+rz6IJnUhGR4eOo8URlCBS/o3pECE6quHr61PfyOv3qBOWQTnSlJG8Ei5Fp5omVEN1uB2cgcofs22MV3F8imQPSawUU0C3wrZJ16v7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772421035; c=relaxed/simple;
	bh=jxtzlMsFJJI3gAHRVmshlhK3zwO8N+vd4+1PWjNXMg4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fAssGs6UVH8fpIfTwfDbPdrLlLHmmqbbweyvqrhnC2JRgqCOzY3dvIzXI1kPWkHsj5qjkix/bHmHCk0mRWDnFCAa0oqhrrZoNnHbQN/DlnaHMxqFtVKAnyjpgc/ndst3nl3Y1Y/EpevfL7EIBap5Y4jkRQll0Q8Ytvy0fbKse6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from Vostro-3710.lan (unknown [IPV6:240e:3b3:2c02:9c10::aae])
	by smtp.qiye.163.com (Hmail) with ESMTP id 355ebdd56;
	Mon, 2 Mar 2026 11:05:19 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: dlan@kernel.org
Cc: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	conor@kernel.org,
	devicetree@vger.kernel.org,
	elder@riscstar.com,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robh@kernel.org,
	spacemit@lists.linux.dev,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: Re: [PATCH] riscv: dts: spacemit: pcie: fix missing power regulator
Date: Mon,  2 Mar 2026 11:05:11 +0800
Message-Id: <20260302030511.30566-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260226-k1-pcie-fix-pwr-v1-1-94b493cd27e5@kernel.org>
References: <20260226-k1-pcie-fix-pwr-v1-1-94b493cd27e5@kernel.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9cac81e3c503a2kunm810cb4777326d4
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCGkxJVh4aQx4eS0wYTx5KSlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJT0seQUgZSEFJGEtJQUIYSktBQRoaHllXWRYaDxIVHRRZQVlPS0hVSktJQk
	1LSlVKS0tVS1kG

Hi,

> &pcie1_port {
>  	phys = <&pcie1_phy>;
> +	vpcie3v3-supply = <&pcie_vcc_3v3>;
>  };
> 
>  &pcie1 {
> @@ -320,6 +321,7 @@ &pcie2_phy {
> 
>  &pcie2_port {
>  	phys = <&pcie2_phy>;
> +	vpcie3v3-supply = <&pcie_vcc_3v3>;
>  };

```
&pcie1 {
	vpcie3v3-supply = <&pcie_vcc_3v3>;
	status = "okay";
};
```

According to DT binding, the vpcie3v3-supply of the &pciex node should
be moved to the &pciex_port node. This is simply a duplication of the
property.

But do we really need this pcie_port (PCIe bridge)?

The PCIe bridge node (pcie@0) was treated as a platform device, but it
did not define the interrupts property, which resulted in the following
warning: `[    2.897980] irq: no irq domain found for pcie@0 !`

Would it be better to submit a patch to remove this pcie_port?

```
-       ret = k1_pcie_parse_port(k1);
-       if (ret)
-               return dev_err_probe(dev, ret, "failed to parse root port\n");
+       k1->phy = devm_phy_get(dev, "pcie-phy");
+       if (IS_ERR(k1->phy))
+               return dev_err_probe(dev, PTR_ERR(k1->phy), "missing PHY\n");
```

I have tested this change and it works.

Thanks,
Chukun
