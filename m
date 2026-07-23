Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70F13CA497
	for <spacemit@lists.linux.dev>; Thu, 23 Jul 2026 06:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784788819; cv=none; b=ZbSFafaRpFxmYl2jnco1ez1hcUmBvjtDf16gtZ53+w+ghttEPaCYPIDU4O+JU4wHR1xBWCuYxxaHbX+K4Fxy7hvShhDaPjr8vkbyQcds6uBA/CRO5pwTseiV+5NxT9SXPVJOMlOzM84gHzewP1k4fXSjOblJJjHAJVNRmB4J4U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784788819; c=relaxed/simple;
	bh=VKWwLW2RzEy1iUFAYIBIyZg75kBJF5lyAJydDa8GmvA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GjXEOH96Ire0hHXZhBEcFfu8XJ/mifOCPyaM5b2M7Ly9bBxTCg/XXxGQGEtB6nkPDULmHqv4X+6Ad3KV2xIbFApH2y7CAo59XE6mg3FNsQ4yxO4eugtBx+zn7ZNZ47VDkodrTDyd6a7Buw+7c6uwiWn4N2sP2My1pbp/eFicocU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from Vostro-3710.lan (unknown [113.80.141.55])
	by smtp.qiye.163.com (Hmail) with ESMTP id 474627f12;
	Thu, 23 Jul 2026 14:40:05 +0800 (GMT+08:00)
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
Subject: Re: [PATCH 1/1] riscv: dts: spacemit: enable PCIe on OrangePi R2S
Date: Thu, 23 Jul 2026 14:40:00 +0800
Message-Id: <20260723064000.848512-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260602100000.2402784-1-amadeus@jmu.edu.cn>
References: <20260602100000.2402784-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9f8db3e5c003a2kunm85ffac06197a60
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCTRlLVkIYHkkfSB1NQ0NOSFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKSkhVQ0tVSk9KVU5OWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg
	++

Hi,

> Enable the two RTL8125 network controllers and corresponding
> PHYs connected via the PCIe controllers on the OrangePi R2S.

friendly ping
