Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133983B5F5D;
	Tue, 28 Jul 2026 11:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785238898; cv=none; b=p3G3yAE9ZMOwgUFE+Z25KDwVVLTq8NUDt2LDDK/11uhRt6VdAbXgb7do6LI9TBSbeSIRgm9HT/iIRUtWbfH5w9T17MJwYbgqSDlqh5IHp+96tL3MVGzv6loFypX4X5axODI/oiLxzJrcLzrCQ5E4WYmE3oy4J19TWldHtmv3AjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785238898; c=relaxed/simple;
	bh=6ed9hhwH5gQIokZSXJUk3+SHA1CGzpgkFdl5Tnl/Ing=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uGkxe7TjiaBwrGTi76irZ1/vXMIlUScd7b9g0+4zsFrxlj38xC7W5WsnuayAdPvmxPK3vGMC2To8z0+cysVMhdTCXrf+sZG1oQtOYtKwpWMsyoCJUXiKBHE2ByDh/C3D8w/7LEbU6Q7srbregdcVIH3v6Ukd4FXfh5HF9iTN4y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CfM2wpok; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CfM2wpok"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C4D51F000E9;
	Tue, 28 Jul 2026 11:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785238896;
	bh=azXT0ZNHvel2jvUvD7O+6uNPNDf+us/70LW0g7DokLk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CfM2wpok3HDUErucZuqaT028yhD7BEMnip1rAVB5y/EtiZ8FGMBnBGIwAdWxdt5rw
	 uu1LnExjYcBA4eJTYVW+ymQD8YOxVRBtulNBLti7c7RV+PSFdFSbodOAymX8UzlZ7s
	 NvGYl+6/5oWljJq6mBVMa5AS0gDEUQi4ykwKZkzRGhc73Iz6MgZwcdI/azTGDeWW0X
	 F2kjIGvzRWoNon12rJVCzl3zboXnIdKuMFTHM43jgRMby6fAfMD9jkK82gLLVGjyBD
	 Kef0s7thBlKGbBkB3nqz1foAo18dWaWATQNEimCZVahJoOnKN93c3VED+v+aDNxfe6
	 zhw08mG2p1ALg==
From: Yixun Lan <dlan@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Jennifer Berringer <jberring@redhat.com>
Cc: Yixun Lan <dlan@kernel.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] riscv: dts: spacemit: add eeprom for K3 CoM260
Date: Tue, 28 Jul 2026 11:41:30 +0000
Message-ID: <178523887414.625374.3693595453960002085.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260722202848.1817988-1-jberring@redhat.com>
References: <20260722202848.1817988-1-jberring@redhat.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 22 Jul 2026 16:28:46 -0400, Jennifer Berringer wrote:
> SpacemiT K3 CoM260 Dev Kit has two eeproms: one on the compute
> module and one on the carrier board. Both use a Giantec
> GT24C02B-2TFLI-TR.
> 
> Jennifer Berringer (2):
>   riscv: dts: spacemit: k3-com260: add eeprom on i2c2
>   riscv: dts: spacemit: k3-com260-ifx: add eeprom on i2c1
> 
> [...]

Applied, thanks!

[1/2] riscv: dts: spacemit: k3-com260: add eeprom on i2c2
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=259f5639b4b1a04cef9a7f79a95ef9ab928264cd
[2/2] riscv: dts: spacemit: k3-com260-ifx: add eeprom on i2c1
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=b1d7f3e7da4230815ad732f764f7978049737bb6

Best regards,
-- 
Yixun Lan <dlan@kernel.org>
