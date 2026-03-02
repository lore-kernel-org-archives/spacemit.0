Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4062129D267;
	Mon,  2 Mar 2026 03:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772421040; cv=none; b=aZgmJJKzyOUNFWNCIniEFwWD1JzPB1dlF40BWxTvaeh3CWDfV8IOnijR9M2e5EJ15NxYAl8pVpLYI1LyV4Qf13LdyQ5y+rYf/BK0raMmWp2sq3f11SuPLpk0PXAB6YwBTjuZPFq6J9I6GxpeWyMrTW/BOkR30R7z7lgJCTswra8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772421040; c=relaxed/simple;
	bh=8piDJdEb2svg4illNkL4A8g7vlo1UGyKKu2McF1IevA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZN0iROExt0ohjxZ4PqWxhnS8e2gTbK/twJY0pwP44nSytD6sDtLyFuYGlQrTN/gPmLQAoiWmbucv2Dz6iCSkOL5/4VEI0mfSe1ZAMLNCO9UHHBWnxKdLDDg6D9LwcKPxhY2EugEsWchfev9mWklMrjO1zEIpnWz1j7Ki1FepH8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o7XfhUmB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o7XfhUmB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0603CC116C6;
	Mon,  2 Mar 2026 03:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772421039;
	bh=8piDJdEb2svg4illNkL4A8g7vlo1UGyKKu2McF1IevA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o7XfhUmBvLDeLHzdlssWu18VjgCZR2PTujFG9ySGUoGwiTUz+wZmawpVch0WHgNll
	 OsumX21hsPbyd7lgfd9c1kvcIrbHet4YlbBKvoWv4z/TU5nnVyHTM865cifRfc28xP
	 tyyPzELsyqOQc4I874jRlSMom7AW20iDttbfH5/x3+FrEaz519ZJJ/zjGRES5K0M8B
	 OAFR8lekHFd2RT8tKggumSUdzue66SStoF6EktHatEt0XH94d1q4k29+PW0YswuZCv
	 F0hC+U0fQuIt3qKnDO+lWAicUMbTlA3w4RH6UZInKZdKv0VPHazr3aX2MA/W9KOXxu
	 L2V3LKUCaObIw==
From: Yixun Lan <dlan@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alex Elder <elder@riscstar.com>,
	Yixun Lan <dlan@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH] riscv: dts: spacemit: pcie: fix missing power regulator
Date: Mon,  2 Mar 2026 03:10:31 +0000
Message-ID: <177242077522.24322.7382117615305152301.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260226-k1-pcie-fix-pwr-v1-1-94b493cd27e5@kernel.org>
References: <20260226-k1-pcie-fix-pwr-v1-1-94b493cd27e5@kernel.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 26 Feb 2026 08:17:55 +0000, Yixun Lan wrote:
> The PCIe port require 3.3v power regulator for device to work properly, So
> explicitly add it to fix the DT warning:
> 
> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pcie@ca400000 (spacemit,k1-pcie): pcie@0: 'vpcie3v3-supply' is a required property
>         from schema $id: http://devicetree.org/schemas/pci/spacemit,k1-pcie-host.yaml
> 
> 
> [...]

Applied, thanks!

[1/1] riscv: dts: spacemit: pcie: fix missing power regulator
      https://github.com/spacemit-com/linux/commit/8a9071299dec817a544c0fb48f7302396fafdc4b

Best regards,
-- 
Yixun Lan <dlan@kernel.org>
