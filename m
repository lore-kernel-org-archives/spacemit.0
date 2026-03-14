Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A0D261388
	for <spacemit@lists.linux.dev>; Sat, 14 Mar 2026 07:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773474647; cv=none; b=OM6+jFZlZpyELSLeh7cPTL5Gabb0Z7JDJpe3rC2ZEl3kd+GdbM+vptrk6zlG0KMoxKfPR5J2EGBBA20lSGyz99RO6bLbbVF0zNem9NW61JsrbAVZv79/etZRHFhF0WQqTlBrtiXMEmwTRZpysiSU6m+szqhzubtoRt/nRn7zp3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773474647; c=relaxed/simple;
	bh=gLkElNC3ATunKczn+tZS/GDOLAtWDHExal+eSc9uxDM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hZfuDYjPDm/qorYwz/NEddQN1xuO0CcVFytHPJGcaHUqp8ndr6/kcDg3sRk76C0gE4846xMfYSGrTCElAdgIfCA3byDzYBCDYOzAf++fqKDaAXzpABMspm88UJ3cmdQa0XKa2GsKhdJVj3096wNa6+rrx6fx9Ul/u1a3IU/fo38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from Vostro-3710.lan (unknown [116.25.94.199])
	by smtp.qiye.163.com (Hmail) with ESMTP id 36eefd4f7;
	Sat, 14 Mar 2026 15:50:36 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: dlan@kernel.org
Cc: alex@ghiti.fr,
	amadeus@jmu.edu.cn,
	aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dlan@gentoo.org,
	gaohan@iscas.ac.cn,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	rabenda.cn@gmail.com,
	robh@kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 7/7] riscv: dts: spacemit: PCIe and PHY-related updates for OrangePi RV2
Date: Sat, 14 Mar 2026 15:50:28 +0800
Message-Id: <20260314075028.2571780-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260310090359-GKF302167@kernel.org>
References: <20260310090359-GKF302167@kernel.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9ceb53613803a2kunmc0b324c6729e4
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZTUxKVhkYGkpLSkseTkwfQlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk9VSkJCWVdZFhoPEhUdFFlBWU9LSFVKS0hJTU9CVUpLS1VKQk
	tLWQY+

Hi,

> I agree, if the phy is used for USB, the pinctrl info can be dropped
> Do you want to submit a patch for this?

I will submit a patch to drop the pinctrl.

Thanks,
Chukun
