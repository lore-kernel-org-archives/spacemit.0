Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B163122258F;
	Wed,  7 May 2025 07:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746603905; cv=none; b=pjx8csrKZz3pMMxg4NDhdWDfGYjHBv6N0Er/Gh0wU8plWNO431SLQwBf7IM0E7/DQL2ehL5z2Ml/AQLWK2D6asqYqmhjv0v3MnSOsUcMcA3Iz6zO+zWi+3xsb+M3a5VG8svTqLDhyTPgwcn8OHGfFKAcokcS5PbJs/+5n8nLVRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746603905; c=relaxed/simple;
	bh=QXHYEKAW9/CqJfMG4iKzrn7ClrN8rdtrlRVJuX/TCQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dUYS3aTv7TLz8IkpeZD7r0Ee1+nMZ8kyrUopyz0vT3r+udPOSJC4YAdnY32b2KVDEFJMhKXSSyScKN09z9P+VabiWmUx3shajkD555yZQe83uF3nFubbAj87iqzBwTdl2T64soQsnOCvxUn3J88b/7YwRf2wT0rX3PZve/P0i2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WIemcZ4F; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WIemcZ4F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746603904; x=1778139904;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QXHYEKAW9/CqJfMG4iKzrn7ClrN8rdtrlRVJuX/TCQQ=;
  b=WIemcZ4FlFAMg0G3RqGAJ1AnGABa47U75szy9UDzjcwvOzGGCrF6e6U7
   kRcIr4JKsJ6f5miloi4psyPBv+73TSrlibA0xPnt5kMoIgNoiunrpTro2
   kjVX/TN8MX4IPUHMbR9Ho6de4vt1GZ+9M3v5G4H6p2IH2uVhsQyR96Rt5
   rWWUZ0sCJZn0B2+QJcnvB/w6PeRURVlzKwgZpa43zsTAgZD6XOoHG5x7F
   Vn6SDhDporW5d6w2Pzlip4fZ9goDVdshyiGMVGY4a1Euvd39D0h/avGx2
   0fncoLMk9pwUElwvXrYuTT3EvOHTS1CJsM3HKUss2RB0VeMbwYkS6j4wX
   g==;
X-CSE-ConnectionGUID: NwOEvRJwQvyGIPmJ06wrXg==
X-CSE-MsgGUID: EnE7cOLjS4GKGtACTjE7qw==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="52133192"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="52133192"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 00:45:03 -0700
X-CSE-ConnectionGUID: E1qZMY2HTZGgYsJVYG+Cvw==
X-CSE-MsgGUID: gTAUAlcERN+/lUFCdLWGCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="135875090"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 07 May 2025 00:44:52 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCZSU-0007LT-05;
	Wed, 07 May 2025 07:44:50 +0000
Date: Wed, 7 May 2025 15:44:01 +0800
From: kernel test robot <lkp@intel.com>
To: Yixun Lan <dlan@gentoo.org>, Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Elder <elder@riscstar.com>,
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>
Subject: Re: [PATCH v2 2/2] mmc: sdhci-of-k1: add support for SpacemiT K1 SoC
Message-ID: <202505071416.Rll3WhPR-lkp@intel.com>
References: <20250501-20-k1-sdhci-v2-2-3e7005fae29b@gentoo.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250501-20-k1-sdhci-v2-2-3e7005fae29b@gentoo.org>

Hi Yixun,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 0af2f6be1b4281385b618cb86ad946eded089ac8]

url:    https://github.com/intel-lab-lkp/linux/commits/Yixun-Lan/dt-bindings-mmc-spacemit-sdhci-add-support-for-K1-SoC/20250501-165846
base:   0af2f6be1b4281385b618cb86ad946eded089ac8
patch link:    https://lore.kernel.org/r/20250501-20-k1-sdhci-v2-2-3e7005fae29b%40gentoo.org
patch subject: [PATCH v2 2/2] mmc: sdhci-of-k1: add support for SpacemiT K1 SoC
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250507/202505071416.Rll3WhPR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071416.Rll3WhPR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071416.Rll3WhPR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/mmc/host/sdhci-of-k1.c: In function 'spacemit_sdhci_reset':
>> drivers/mmc/host/sdhci-of-k1.c:88:33: warning: variable 'pdev' set but not used [-Wunused-but-set-variable]
      88 |         struct platform_device *pdev;
         |                                 ^~~~


vim +/pdev +88 drivers/mmc/host/sdhci-of-k1.c

    85	
    86	static void spacemit_sdhci_reset(struct sdhci_host *host, u8 mask)
    87	{
  > 88		struct platform_device *pdev;
    89	
    90		pdev = to_platform_device(mmc_dev(host->mmc));
    91		sdhci_reset(host, mask);
    92	
    93		if (mask != SDHCI_RESET_ALL)
    94			return;
    95	
    96		spacemit_sdhci_setbits(host, PHY_FUNC_EN | PHY_PLL_LOCK, SDHC_PHY_CTRL_REG);
    97	
    98		spacemit_sdhci_clrsetbits(host, PHY_DRIVE_SEL,
    99					  RX_BIAS_CTRL | FIELD_PREP(PHY_DRIVE_SEL, 4),
   100					  SDHC_PHY_PADCFG_REG);
   101	
   102		if (!(host->mmc->caps2 & MMC_CAP2_NO_MMC))
   103			spacemit_sdhci_setbits(host, MMC_CARD_MODE, SDHC_MMC_CTRL_REG);
   104	}
   105	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
