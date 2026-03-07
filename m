Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6AF3368AF
	for <spacemit@lists.linux.dev>; Sat,  7 Mar 2026 07:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772866850; cv=none; b=uOstt2jWbDQ7KJix7qpo3MW8GsKmommnmNUMa1TEo5h+c2aLNm6RQ9JoeIJlU+zIyFjZU2VwGTFSFNe8lNRlFqQ5zA27FhdF7ocIHHRyRhfFZNOYG0/NpxhofyfPFKe67ncdgKNc/JtHScNcwYRstKFsYiCnldmOHV3PJEjSvVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772866850; c=relaxed/simple;
	bh=E9xSzhEG60dObT/Xo4cqG5jmz3opqMdOnErEmUCuL48=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=k6Ckam4XDfDO2qzfsqa1WRIqmVedbeT91yEFbbdjwQXVX9ivSXgRn4r32aAVcaZV7cobOJxRGRvrqxNjeUmqFegI42CiTKoUvSYVIle9K8zD2TXgxROT5Mi+smNMDBePVYdNA6UkfdfSsCOwac19zWRb6x4lWZY2SJ3+8GTJB9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from localhost.localdomain (unknown [58.61.141.9])
	by smtp.qiye.163.com (Hmail) with ESMTP id 36147d6ec;
	Sat, 7 Mar 2026 12:38:12 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: dlan@gentoo.org
Cc: alex@ghiti.fr,
	amadeus@jmu.edu.cn,
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
Date: Sat,  7 Mar 2026 12:38:06 +0800
Message-Id: <20260307043806.957175-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260302074235-GYB288339@gentoo.org>
References: <20260302074235-GYB288339@gentoo.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9cc696b9c303a2kunmfc861db58871d2
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCGB0YVhpNSRlLSx9MSx4ZT1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlOQ1VNSlVKT0pVQllXWRYaDxIVHRRZQVlPS0hVSktISk5MTlVKS0tVSkJLS1
	kG

Hi,

> You describe what's has been done here, but no why?

Because the PCIe boot order is random, if there are two R8125
network cards, their interface names will not be fixed.

For example:
First boot:
pcie@ca400000 -> eth2
pcie@ca800000 -> eth3

Second boot:
pcie@ca400000 -> eth3
pcie@ca800000 -> eth2

If their PCI domain numbers are fixed, I can fix the interface
names by matching /sys/devices using a script.

> Can you add description about why problem with random domain,
> and the motivation of the change behind?

Should I improve the commit messages?

Thanks,
Chukun
