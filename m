Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C503A1696
	for <spacemit@lists.linux.dev>; Thu, 30 Apr 2026 10:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777544616; cv=none; b=Sh772LImQx8o9w1JP1vu13zXfB3GfXggYKcetBYNbmzOsbCClUya6aqpIs2pmCSovSoYkJDJwN9iKM73yHARZ057CTByJHo86/jPIp6jippoz+j9R3uYCDooNrNLtRHKYnUaO4DTKLeU4rIJCzZx7S9acORuOAJ/lFiCue0jQLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777544616; c=relaxed/simple;
	bh=/hQ4qJLy3jm7/UQnRB013PzjqtiQSTezw5Wx/dyiEjQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IzJP1VFctBSUV2yHBKwf1N8h4loN7DE3Bgrep00ynTDDzl+iYzQ7NxvBS7P7a/oloXn7q9lLTiUcqBl4DslhMMMi4Y7gUbHnJN4KmZvciviZZsKWoh71NjZLGFuV/gODjLjqFZJLNQhQ6iY4IjoEoTB0gf9qkM6NHsGJiIbo9z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from Vostro-3710.. (unknown [119.122.215.211])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3cc362e3e;
	Thu, 30 Apr 2026 18:18:15 +0800 (GMT+08:00)
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
Subject: Re: [PATCH v3 0/3] riscv: dts: spacemit: enable USB3 on OrangePi
Date: Thu, 30 Apr 2026 18:18:01 +0800
Message-Id: <20260430101801.642870-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260410100010.1197804-1-amadeus@jmu.edu.cn>
References: <20260410100010.1197804-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9ddde5758d03a2kunmc2c93faf17d3cf
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDHU1CVh1JTExCTUgZS0MZH1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKSkJVSklJVUlKTlVJSkpZV1kWGg8SFR0UWUFZS1VLVUtVS1
	kG

Hi,

>   riscv: dts: spacemit: add fixed regulators for OrangePi R2S
>   riscv: dts: spacemit: enable USB3 on OrangePi R2S

Friendly ping
