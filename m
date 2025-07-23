Received: from smtp1.iitb.ac.in (smtpd9.iitb.ac.in [103.21.126.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6E01E1C22
	for <spacemit@lists.linux.dev>; Wed, 23 Jul 2025 05:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.21.126.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753249072; cv=none; b=m0BSaV+aTJtWkOXO/4tFostZeap2e3lZbAAjirjpzBYF8oyLyNa+fp1TGMpTGk42R/f654Mc40Sj8kxhEx8UwLjPi+YNZGBXdwkQRYPdepz/bwwNEAJVUaRI7zxw0oB6cxRsFBws0l6imnSZlUYOBDev1zPMXtTpV8uzysOrCLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753249072; c=relaxed/simple;
	bh=jgmU0mVrM9TEWK9SDqyK12S6GaRiPg9G1If9CLN/p8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I1zbaFDpLI/J+TVzmwOawnBkyhA3NJA7okxUHts1N+YyUL3vgAjCxzq1hqlj4YxgDK2z+uZEJ7zLLBw/iH5EqmNYU3Fc8VfoJQaMmsR4umYIF/g0268OX7yOyLueSFuXbMiKUS1E4f9ZjQSEDjrwsZ+aZoDjuNvVXR+Ie8XAGaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ee.iitb.ac.in; spf=pass smtp.mailfrom=ee.iitb.ac.in; dkim=pass (1024-bit key) header.d=iitb.ac.in header.i=@iitb.ac.in header.b=nuvd4NNk; arc=none smtp.client-ip=103.21.126.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ee.iitb.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ee.iitb.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iitb.ac.in header.i=@iitb.ac.in header.b="nuvd4NNk"
Received: from ldns2.iitb.ac.in (ldns2.iitb.ac.in [10.200.12.2])
	by smtp1.iitb.ac.in (Postfix) with SMTP id 7D3881080251
	for <spacemit@lists.linux.dev>; Wed, 23 Jul 2025 11:07:47 +0530 (IST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.iitb.ac.in 7D3881080251
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=iitb.ac.in; s=mail;
	t=1753249067; bh=jgmU0mVrM9TEWK9SDqyK12S6GaRiPg9G1If9CLN/p8M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nuvd4NNkx9+OaWJx8MshqRM6HGFPCey7VmVboKOkbDftyBkdZPud0RFn8SnWFzEtt
	 dupzPgNxoowLXB5IZhR6ulEonRR2v0VyilSdbojQeZP33hmNQfROUlRvE8x2Wetwd7
	 TWuB1VNhN351k1gOh0+VwWFzwZ53Rl3ryenCN72Y=
Received: (qmail 15488 invoked by uid 510); 23 Jul 2025 11:07:47 +0530
X-Qmail-Scanner-Diagnostics: from 10.200.1.25 by ldns2 (envelope-from <akhilesh@ee.iitb.ac.in>, uid 501) with qmail-scanner-2.11
 spamassassin: 3.4.1. mhr: 1.0. {clamdscan: 0.100.0/26337} 
 Clear:RC:1(10.200.1.25):SA:0(0.0/7.0):. Processed in 3.944097 secs; 23 Jul 2025 11:07:47 +0530
X-Spam-Level: 
X-Spam-Pyzor: Reported 0 times.
X-Envelope-From: akhilesh@ee.iitb.ac.in
X-Qmail-Scanner-Mime-Attachments: |
X-Qmail-Scanner-Zip-Files: |
Received: from unknown (HELO ldns2.iitb.ac.in) (10.200.1.25)
  by ldns2.iitb.ac.in with SMTP; 23 Jul 2025 11:07:43 +0530
Received: from bhairav.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	by ldns2.iitb.ac.in (Postfix) with ESMTP id 4BA853414F2;
	Wed, 23 Jul 2025 11:07:42 +0530 (IST)
Received: from bhairav-test.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	(Authenticated sender: akhilesh)
	by bhairav.ee.iitb.ac.in (Postfix) with ESMTPSA id 034231E81366;
	Wed, 23 Jul 2025 11:07:42 +0530 (IST)
Date: Wed, 23 Jul 2025 11:07:36 +0530
From: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
To: Haylen Chu <heylenay@4d2.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, dlan@gentoo.org,
	elder@riscstar.com, inochiama@outlook.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, heylenay@outlook.com,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, unicornxdotw@foxmail.com,
	jszhang@kernel.org, zhangmeng.kevin@linux.spacemit.com,
	akhileshpatilvnit@gmail.com, skhan@linuxfoundation.org
Subject: Re: [PATCH] clk: spacemit: ccu_pll: fix error return value in
 recalc_rate callback
Message-ID: <aIB1IPa9HBDh+Vns@bhairav-test.ee.iitb.ac.in>
References: <aH6P3lChCXhi3pe4@bhairav-test.ee.iitb.ac.in>
 <aH7kjkC_YSEi7dFz@ketchup>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aH7kjkC_YSEi7dFz@ketchup>

On Tue, Jul 22, 2025 at 01:08:30AM +0000, Haylen Chu wrote:
> On Tue, Jul 22, 2025 at 12:37:10AM +0530, Akhilesh Patil wrote:
> > Return 0 instead of -EINVAL if function ccu_pll_recalc_rate() fails to
> > get correct rate entry. Follow .recalc_rate callback documentation
> > as mentioned in include/linux/clk-provider.h for error return value.
> 
> Nice catch, thanks.
> 
> > Signed-off-by: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
> 
> Here misses a Fixes tag. With this added,
> 
> Reviewed-by: Haylen Chu <heylenay@4d2.org>
> 
Thanks Haylen and Alex for the review. Sent V2 patch with Fixes tag.

> > ---
> >  drivers/clk/spacemit/ccu_pll.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/clk/spacemit/ccu_pll.c b/drivers/clk/spacemit/ccu_pll.c
> > index 4427dcfbbb97..45f540073a65 100644
> > --- a/drivers/clk/spacemit/ccu_pll.c
> > +++ b/drivers/clk/spacemit/ccu_pll.c
> > @@ -122,7 +122,7 @@ static unsigned long ccu_pll_recalc_rate(struct clk_hw *hw,
> >  
> >  	WARN_ON_ONCE(!entry);
> >  
> > -	return entry ? entry->rate : -EINVAL;
> > +	return entry ? entry->rate : 0;
> >  }
> >  
> >  static long ccu_pll_round_rate(struct clk_hw *hw, unsigned long rate,
> > -- 
> > 2.34.1
> > 
