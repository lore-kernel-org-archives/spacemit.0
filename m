Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9225226CFD
	for <spacemit@lists.linux.dev>; Mon,  9 Feb 2026 06:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770619545; cv=none; b=FJr6sdBd6mvOFnXfwZnAZsbVlN77CjU0UyNqkQV0T8CHr7WgUWCYvTEAtZCOR06/SMeRRa6zRJR5bqecWlgzBfoqMT9hrVMlg1gAqdKM6GCcZ5LOnFTLLyBpemng81uArf3Nvj2FGPBlx8LlSG5ru7yXpwEH1WfAjIJ2oZkM/uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770619545; c=relaxed/simple;
	bh=y/l6+Ija1u/P/FJiwKYRWfvYv/5dwGlqD4ARAsHJFH4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uNTMjv0BiWVCvI/bvAey7ewVgIfhVL5Vl2r/yAr+K78gevj/4vG4NeEkC3bk1yhzoXrwxZbtjEGlsNwlhs3CYGqypSJR86bnKvvJiuSjwtGKr8HCPUP6NSD+ArDNlYEhdvbrrJ5ysuAkj6bwz5sbFblpbjoaroXTIuTjBURfSBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from localhost.localdomain (unknown [58.61.141.99])
	by smtp.qiye.163.com (Hmail) with ESMTP id 33912914e;
	Mon, 9 Feb 2026 14:40:25 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: krzk@kernel.org
Cc: amadeus@jmu.edu.cn,
	broonie@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dlan@kernel.org,
	huang.ze@linux.dev,
	krzk+dt@kernel.org,
	lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	neil.armstrong@linaro.org,
	robh@kernel.org,
	spacemit@lists.linux.dev,
	vkoul@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: phy: spacemit: add regulator support to K1 USB2 PHY
Date: Mon,  9 Feb 2026 14:40:16 +0800
Message-Id: <20260209064016.1176056-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <8c3835c4-3602-4cee-9631-0551b0341918@kernel.org>
References: <8c3835c4-3602-4cee-9631-0551b0341918@kernel.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9c412143aa03a2kunmf6f2d9044b9dc8
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDS0tDVhlKShhMGUMaH0wdTVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlOQ1VNSlVKT0pVQkJZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE5VSktLVUpCS0
	tZBg++

Hi,

> Plus, if this was a vbus regulator it would not be called "phy"...
> Even more confusing.

Sorry, I didn't consider that this naming is confusing. Other
platforms, such as Rockchip's inno-usb2phy driver, use the
"phy-supply" property. I continued with this bad naming.

> Bindings are supposed to be complete regardless what driver does
> (or does not).
>
> You must list all supplies with proper names.
>
> If this regulator was missing, then what else?

(...)

> Please start describing in the bindings your complete hardware, not
> your drivers.

It appears Ze Huang described the vbus-supply property in
spacemit.k1-dwc3.yaml. So I should enable the regulator in
the dwc3-generic-plat driver. Sorry for the noise.

Thanks,
Chukun
