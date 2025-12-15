Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3C11FC0ED
	for <spacemit@lists.linux.dev>; Mon, 15 Dec 2025 02:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765767389; cv=none; b=rbtHbXN38mq6Cof03EybCZKMhZ2nPbOV8aDvWU9PYEwvp6pgJiBqNhyNsg+861QZLLh/FXupHZbQkYz535EesuqpdeYiSg+MIxHHxT+BPgkZf6Ffo+0ff8qxlYguEThSnhOIQZqjbHldVCoCggNNBccIe3wXmc4cpA0Bhla3vjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765767389; c=relaxed/simple;
	bh=02le5Uu03CIFhEGQZ7SxFE873qcp7iGtRff7fvnppxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WX1FkrvE5NeKV6jq3q5Gna6RVXvLDBFVpkO/WnmAY8NpCg+qwhoPL2jEqsv3uAT6xLcJUP7IOK+3kaoooRea+9BelwkZja1cBWCo2FMDnrxYrJDBBg0VnVxtIyNGv4+Q9Bg3MNUGRp/zCQQkU+eBTI3DAEu9gADEvsu6CS+Y15M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=wu7/HYl6; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="wu7/HYl6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1765767288;
	bh=ePccDOthFyLYtm90K2o9nMjYsKD7YRLlY05U0kQc0FE=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=wu7/HYl6TDvK9IYrmfCs1XC9Y1HsgSad5JA2mQHBDs6+WCnldIx4IOfb4wuS7QAi/
	 yDRQ/Op4UM7VbHumZISHA1uUbHVo9sQyXYveBbtNiIL3y6pdrUZram1q+N7aYaD+ND
	 dRLOgOxTaVKCLo55FcxGIsLQGHMqSQ7xrCmi0dWA=
X-QQ-mid: zesmtpsz6t1765767284t6cf729bf
X-QQ-Originating-IP: 9pTzAVsmuC6mHETYV41cHodoDPvc/PLgk8GGdyTolFM=
Received: from = ( [183.48.246.103])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 15 Dec 2025 10:54:43 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2478898065667183843
EX-QQ-RecipientCnt: 14
Date: Mon, 15 Dec 2025 10:54:42 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Inochi Amaoto <inochiama@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Haylen Chu <heylenay@4d2.org>, Brian Masney <bmasney@redhat.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Alex Elder <elder@riscstar.com>,
	Akhilesh Patil <akhilesh@ee.iitb.ac.in>
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH] clk: spacemit: Fix module build for spacemit common ccu
 driver
Message-ID: <EE6920993009E270+aT94cmKTM0tHn8Ly@kernel.org>
References: <20251214232938.668293-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251214232938.668293-1-inochiama@gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: N2msJaiA+ppMoK38P6mvOs1kBiDz8Jf2CIP293VWTRVbv++ahMObJ4vt
	/bvmTHqoJhuUiA0fy1LLqv2cP87jWGXItZA2quUcC5CtxL7bMNH6tTADQzq7wxOPzRIH4AS
	/4A5vNEE3tchovlvWJB1xe8g1iUYqN989t0iRKkw4PUFKXy7qpkVj3ho4xVtLDNEwAynpiU
	BlTlZWAkxSJjANZ1avdJ/2SVPaC2b8+rv91Lt4MSJoP69++ohTk02hQnFC4AwK+LG3mP0No
	StffNkG/cnHzpM+tpIWG8uivOsH+Wy4tLTEHznaOv1dNCHVMtQnm6+E3fkHg52ObywKrcu3
	fjkORVJKYHKWxw4G64e1VjWRCkksimfTYQ+mlwovNcVYktHUIn2Lhc1PsBWpCQa4sBgKCN9
	l60y/h17lTzZuXBoG6j3pBtd/gU5qTXNsKr5G0IMJgX8ENAoMx+Ro6ZhQoj6FTxqceClZUH
	a2GdCompGjHeq7t0Q+gpbuthR9z8pTR2RucE6MxuYXCiuIp/3EuphqhqYFxx4kJcfZxl2dP
	2COm/JAwVi58IV7E5IBxlo1WDt+PFJ8sgaEaY/4srRKyodGH9urvh6cCRtsjh/jhpXdsG2T
	2ZNSq7DBBP1kBACoaVnfs9rZqYUxEdFSDod22VBypaEHgO+/KbhjIFakJYBxWLdimfjvhVE
	8BEsu83mtYMqRZpYhy1aJ+3Lea9IyuLAcBTvRn2LurqR4RSYYFqM8/aRam+LbpXhIxRmCSt
	g7+aIJ8zk0QKX1FnFCyAi0GnQTWFN/mV++3jWgIh04HbZUi6W6401UIlkdtrk19FMYY4z7C
	sZvetOeyB3l1ISJ2AZGCTFX6SOsl8ahaP6iASbEV271sP0kgbx57i1mRBxw+S1maKa0dHTB
	hViKXKMXpxCK7YmW7B3W9XVPFjHUxP0PGk/ckC3Yj/0fjnKIUh0DkqtwJAB7fH++I8SmqSG
	GT6GlOOFdWBAhKJnh3iTS0HnpqDYlw2UormhO/VRkyy+nvMPlPUgFjpHBkZ8uQ8f7ptk/vv
	Ks0JUIb2EPAQow3RwfpN2pozw0BR6etQvCoQq3uZTcEVwqRJkcRZ0WA63ITLkDaUuwPbODV
	uZok5l9HLlAN+Q8Ay1ursU6G/9+OL/zJg==
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0

On Mon, Dec 15, 2025 at 07:29:37AM +0800, Inochi Amaoto wrote:
> For build spacemit common clock driver as a module, the build
> process require MODULE_LICENSE()/MODULE_DESCRIPTION() globally
> and EXPORT_SYMBOL() for every exposed symbol. Otherwise, the
> build will fail.
> 
> Add these missing hints, so the driver can be built as a module.
> 
> Fixes: 1b72c59db0ad ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Thanks.

Acked-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
