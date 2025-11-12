Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D29030C617
	for <spacemit@lists.linux.dev>; Wed, 12 Nov 2025 11:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762945682; cv=none; b=FpAXPvMUMWG+NPXDsILCvz7+iErCSm3057JvIOEvC4Xrt6ClzXOwNa4FgeEctko/JWGuJ/Lctc/M9odJUG+DdMaO7aD2OnhCqzBzY7Z2Yu6MicWSwWw66CVgg9R6Xvl6LBBgt2J/m8d+WE3CVH19r6YzBTEmR86l8ql6huEjqpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762945682; c=relaxed/simple;
	bh=uqkL3SrtuGeVvteGOfBIC73HcMqzkl2+on4R0tnPUjE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KzQ8YtlkJyQS0ppOuXfeGWAysMVg3HpGdoNQzevo7bPtudqrvCQEobkNLBKjhgG63cax+ZNK7jr1k5/TjtcEjMncIge7rkrblQL2/a5JJEevv5zbdW/fFiRSmdMsHSZeCLYnZzrOYIkAYRPV2QN5VrZdebp30M0WdjOkhEiURQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from ofsar (unknown [116.232.48.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 3BA28341E70;
	Wed, 12 Nov 2025 11:07:53 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Encrow Thorne <jyc0019@gmail.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@gentoo.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] riscv: dts: spacemit: define all missing I2C controller nodes
Date: Wed, 12 Nov 2025 19:07:48 +0800
Message-ID: <176294559674.467363.5417599191009488468.b4-ty@gentoo.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251105-k1-add-i2c-node-v1-0-d18dae246137@linux.spacemit.com>
References: <20251105-k1-add-i2c-node-v1-0-d18dae246137@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 05 Nov 2025 11:37:42 +0800, Troy Mitchell wrote:
> Some I2C controllers exist in the hardware but are missing in the dtsi
> file.
> 
> This series adds the corresponding nodes.
> 
> 

Applied, thanks!

[1/2] riscv: dts: spacemit: reorder i2c2 node
      https://github.com/spacemit-com/linux/commit/3b70f972b6fb769bdee780b5b4639585845d6af4
[2/2] riscv: dts: spacemit: define all missing I2C controller nodes
      https://github.com/spacemit-com/linux/commit/5a97a38c22799a802f33001dcb022d2942fe4a41

Best regards,
-- 
Yixun Lan

