Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E563246F0
	for <spacemit@lists.linux.dev>; Fri, 19 Dec 2025 12:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766146876; cv=none; b=ey2SobC6puwVXyDw+b+jN7st1fyL5DJ+WAIA90QINtkzgwf9ACNh2llXkh4En5jqiGXKfnEDfw2iXMGKKdKmuA+4By39h6xgd659ER4U75IofRzBNHAxtoAoAUGekyQz+gCLvIj4rpZIP+j2xSdyr/KEdweMBGYMayyktG3RPC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766146876; c=relaxed/simple;
	bh=zS1QVS76WqapJGNXOSxfus0t1YMXYgzxj4gvE0wzD5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y3+Ec0kXNOMwGG+42VWiSvEpbE0zDkqmdLBjPZBxq9L5pECk23AeL4qzCTezMfi0FP8cUjSoYPXpcc64Gw83/7vvd/x7srEP5zOtfQ6qVG1x6fjeAVMO5MrmckJ2qumquNAjMIlaJ2onIx+Y9Y7BioachqLmrRUSk1U1K8jKz4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 7F579341006;
	Fri, 19 Dec 2025 12:21:13 +0000 (UTC)
Date: Fri, 19 Dec 2025 20:21:03 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Alex Elder <elder@riscstar.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, guodong@riscstar.com, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 5/5] riscv: dts: spacemit: PCIe and PHY-related updates
Message-ID: <20251219122103-GYD1958363@gentoo.org>
References: <20251218151235.454997-1-elder@riscstar.com>
 <20251218151235.454997-6-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218151235.454997-6-elder@riscstar.com>


On 09:12 Thu 18 Dec     , Alex Elder wrote:
> Define PCIe and PHY-related Device Tree nodes for the SpacemiT K1 SoC.
> 
> Enable the combo PHY and the two PCIe-only PHYs on the Banana Pi BPI-F3
> board.  The combo PHY is used for USB on this board, and that will be
> enabled when USB 3 support is accepted.
> 
> The combo PHY must perform a calibration step to determine configuration
> values used by the PCIe-only PHYs.  As a result, it must be enabled if
> either of the other two PHYs is enabled.
> 
> Signed-off-by: Alex Elder <elder@riscstar.com>
for this patch

Reviewed-by: Yixun Lan <dlan@gentoo.org>

-- 
Yixun Lan (dlan)
