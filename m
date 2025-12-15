Received: from mail77.out.titan.email (mail77.out.titan.email [3.216.99.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4DE52D7D2E
	for <spacemit@lists.linux.dev>; Mon, 15 Dec 2025 13:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=3.216.99.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765804624; cv=none; b=i/Yw8Tx3Tt5zZhSVHxTD3B/jILf6hDp34WVRcveOa6AqoWveAey3PR9qTYH4vKnYfSXYR5LRiWdc980yTscAtUd8SBzeZjakZd+6uTN0B1607C8HN4XgRBuaYuFGkpU2+yZdZipbV+ak5oRM3bBOatg5SP2LSacPFaJYS4RPYQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765804624; c=relaxed/simple;
	bh=mpbt18NguGX0FgQtNbhKF4MPpHGAF/nbFDZl+SVp7I8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B9DbHEDpenREG+eaohDXY42zs6FVX9JIro0pzTC22dCT7JjRyf58Jq/WGDmTp9yG8x3CBHhQtdbaQ3uwpD6j4NMn/O7RZuQvunx8jI9Q7BX9gc1eGebPnDSoDpmP0V8Ca1W5KfzimQKbCKi/uYDsG7sc+qBrh68jNQ76H1HnaGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc; spf=pass smtp.mailfrom=ziyao.cc; dkim=pass (1024-bit key) header.d=ziyao.cc header.i=@ziyao.cc header.b=btHMu4ZO; arc=none smtp.client-ip=3.216.99.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ziyao.cc header.i=@ziyao.cc header.b="btHMu4ZO"
Received: from localhost (localhost [127.0.0.1])
	by smtp-out.flockmail.com (Postfix) with ESMTP id 4dVKqY6KDsz9rvZ;
	Mon, 15 Dec 2025 12:58:17 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; bh=RiuvV8doWIvI+LA/Gooe1GSm+xuIbthDxNBReRo2tDM=;
	c=relaxed/relaxed; d=ziyao.cc;
	h=date:references:mime-version:from:to:subject:in-reply-to:cc:message-id:from:to:cc:subject:date:message-id:in-reply-to:references:reply-to;
	q=dns/txt; s=titan1; t=1765803497; v=1;
	b=btHMu4ZOZqZmz3/4qj/V5BIFQqr8Cc9S5/UaVgvlxgBKFcAdNPMJ+8umJSdecIbmeer5UDto
	+OPI8vUZhXaZcaagzxGX2Lt3UFYJbousox8n3hEUkFbetxdZYpbL2STCStcswmcQ8Ly4oCSoa+Y
	gL6ssj50X6GJqpPcGPHwuYz4=
Received: from pie (unknown [117.171.66.90])
	by smtp-out.flockmail.com (Postfix) with ESMTPA id 4dVKqV6wxkz9rym;
	Mon, 15 Dec 2025 12:58:14 +0000 (UTC)
Date: Mon, 15 Dec 2025 12:58:10 +0000
Feedback-ID: :me@ziyao.cc:ziyao.cc:flockmailId
From: Yao Zi <me@ziyao.cc>
To: Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Yixun Lan <dlan@gentoo.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 1/2] riscv: dts: spacemit: Add i2c buses on OrangePi RV2
Message-ID: <aUAF4iNjuP5AWJaf@pie>
References: <20251215-k1-boards-add-mmc-v1-0-d68dc87d4aab@rootcommit.com>
 <20251215-k1-boards-add-mmc-v1-1-d68dc87d4aab@rootcommit.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215-k1-boards-add-mmc-v1-1-d68dc87d4aab@rootcommit.com>
X-F-Verdict: SPFVALID
X-Titan-Src-Out: 1765803497717525709.21635.4362804983732486918@prod-use1-smtp-out1003.
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.4 cv=a8/K9VSF c=1 sm=1 tr=0 ts=694005e9
	a=rBp+3XZz9uO5KTvnfbZ58A==:117 a=rBp+3XZz9uO5KTvnfbZ58A==:17
	a=kj9zAlcOel0A:10 a=MKtGQD3n3ToA:10 a=CEWIc4RMnpUA:10
	a=FRBM4k6udOhyZSGeKOUA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
	a=ZXulRonScM0A:10 a=zZCYzV9kfG8A:10 a=3z85VNIBY5UIEeAh_hcH:22
	a=NWVoK91CQySWRX1oVYDe:22

On Mon, Dec 15, 2025 at 10:10:14AM +0000, Michael Opdenacker wrote:
> The OrangePi RV2 board exposes i2c2 and i2c8 buses
> from the Spacemit K1 SoC.
> 
> This declares devices present on such buses, in particular
> the at24 eeprom to store MAC addresses and the regulators
> attached to the PMIC on i2c8.

This series is named as "Attempt to enable MMC on SpacemiT K1 boards",
what's the relationship between MMC and PMIC/I2C bus? You didn't make
use of any regulators in the second patch, either (which seems wrong to
me).

vmmc-supply specifies the card's power supply. And if you want to enable
SDR modes which mandate 1.8v IO level, vqmmc-supply is also necessary
for switching between 1.8v and 3.3v.

Regards,
Yao Zi
