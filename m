Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE843E1D14
	for <spacemit@lists.linux.dev>; Thu,  2 Apr 2026 13:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775135199; cv=none; b=OLPR5GmS/Rvd9DH1AcnSXbHGXNbR5fQDQMaCIProKnDCT8I6MMraucVWCXOH6qxhog+C8X0SFFt4/t41kwn0R3/YyOFFLrxvn05jqFYv+oO6se4dWnfupuut4f2jQQMNG1UqFxVaxHxs6YhgwnkCAxXozYZr01BpMevqD7S6WLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775135199; c=relaxed/simple;
	bh=/DOuq4lXOLjWo5e0a+fobfVJaiIr6ZLUSXNlbw9I7Ss=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aRiATnDNNcHaiFfie9AEnRNuKMxR4vvJ4lZdjn/IJ2DtAQTa3YZ6n1Xv4nJuTZwd1/8b5Cpwnwti8WUfIxzZ2fljNBcXZAiJhYdef7CiTdTrSMOiEaYAbhlxzi6HoaWN/zNy1o7Y2xP/EP4hGmcl5IGf8D1IX7D5kdPZ5JihsZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from localhost.localdomain (unknown [116.25.95.185])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3952f1f5d;
	Thu, 2 Apr 2026 21:06:25 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: dlan@kernel.org
Cc: alex@ghiti.fr,
	amadeus@jmu.edu.cn,
	aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robh@kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v2 3/3] riscv: dts: spacemit: enable USB3 on OrangePi RV2
Date: Thu,  2 Apr 2026 21:06:08 +0800
Message-Id: <20260402130608.133154-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260402122045-GKA1016296@kernel.org>
References: <20260402122045-GKA1016296@kernel.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9d4e4d59b903a2kunm0261889f563bc6
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCHhgdVk5LSh0aSUpLSEJOTVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk5VSkNOWVdZFhoPEhUdFFlBWU9LSFVKS0lCTUtKVUpLS1VLWQ
	Y+

Hi,

> Can you work with Han for adding USB support[1]? this will simply
> distribute our effort, and make the review process even harder

Sorry, I didn't consider this. 
Could you drop this patch ([PATCH v2 3/3]...)? 
The first two patches should not cause conflicts.

> > +	vbus-supply = <&vcc5v0_usb30>;
> IMO, the vbus doesn't directly tie to dwc3 host, but to HUB's port
> so I think this is still wrong, although it may work on the board..

We can switch to the onboard_usb_dev driver after it's merged.
Keeping vbus always-on may cause unnecessary waste.
I won't insist if you think this is wrong.

Thanks,
Chukun
