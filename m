Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BC5317161
	for <spacemit@lists.linux.dev>; Sat, 30 May 2026 02:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780107359; cv=none; b=skuEbtGdbg+oVzIGtmoN7YiUpuv6aPqyVmNVFNK7Wst+ZmpNeDSNobrnQHwo2txbsw0tygHcIFV12o1LqYzPB0NhaZjOw9Cbf0rt+hAo+22Ci8SHNWQ96TEJ259tI4yJFNOLGCqg7SUnOXPPe3fN/zeWbzeUGyMf9cz5In9AyzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780107359; c=relaxed/simple;
	bh=4Drpa48EasU2oIGD6Uv2tzatMur7/jZDIFOEkc3wBDw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=A6EJFuGq0cCPkdGGrFXfbRa4BkQMVuy8N029ytRz7EGwkXiQLFJEDksKoqgi/XYD6X1rOcvnYFU7sQLjf4FIytHZCP7RnQY7IA8ja5/AWsNTOld+bw7FComg3KWcpbbDT4nRuUJalT1su4PRaN7hm9nWJHbB/30l3hlVmS3SJFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from Vostro-3710.. (unknown [113.80.141.91])
	by smtp.qiye.163.com (Hmail) with ESMTP id 40645a59b;
	Sat, 30 May 2026 10:10:36 +0800 (GMT+08:00)
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
Subject: Re: [PATCH 1/1] riscv: dts: spacemit: enable PMIC on OrangePi R2S
Date: Sat, 30 May 2026 10:10:21 +0800
Message-Id: <20260530021021.1167953-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260520100000.575719-1-amadeus@jmu.edu.cn>
References: <20260520100000.575719-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e76a5c82e03a2kunmcb4f5292e3422
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCHRpDVh8aSkIeQhhLT0lJTlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKSkhVQ0tVSk9KVUJKWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg
	++

Hi,

> Enable the i2c8 interface and add the connected SpacemiT P1 PMIC and
> its associated regulators to support voltage regulation on the board.

friendly ping
