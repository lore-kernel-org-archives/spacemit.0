Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C45C2563
	for <spacemit@lists.linux.dev>; Fri, 31 Jan 2025 02:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738291127; cv=none; b=RY6sWrybKMNHRdNl2vezM6/RW38QOCliPPF/A/3VDw9/5PpJeP8HPzS2LKmjDnXbYmSBuiDastyWynR9PcF4zOr8GL/zuqCxG6i82TXUKAKSyrp74JInyZu3tTHvPp7KOyrhH5QNjkuWDwIBoKzAfJ1PYYPdNlXNZ7jZMxfjPoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738291127; c=relaxed/simple;
	bh=on6/0ok63OPgdbRNbRTd8S36mrF8eFwWcU/42UHDm1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iQBf6bSsXCvX6niFWIjoRTpDuKB0Jq2XuIS0tkxWAzV5Nj2DVWtxSmjjr1NOwspllLc9PO3fbuJV8A4gxeKbELNAuDF2OXV+Zbr/S1gRrFT+96fk528Lse9gRVYOh2xzUX0HncEdjPbFdJ7iyd6cCicz+HMPDHxrtLonxND6dv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.60.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id C2CB434310A;
	Fri, 31 Jan 2025 02:38:44 +0000 (UTC)
Date: Fri, 31 Jan 2025 02:38:35 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Yanko Kaneti <yaneti@declera.com>
Cc: spacemit@lists.linux.dev
Subject: Re: Hello and some questions
Message-ID: <20250131023835-GYA54139@gentoo>
References: <4b4b0448f3482717910e2b48d43cc4ffe909c1ae.camel@declera.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b4b0448f3482717910e2b48d43cc4ffe909c1ae.camel@declera.com>

Hi Yanko:

On 14:32 Thu 30 Jan     , Yanko Kaneti wrote:
> Hi,
> 
> I was wandering is anybody from SpacemiT actually involved in this
> (upstreaming) effort (i.e. at least reading this list) 
not sure, but I hope so

> or is it all non-spacemit volunteer based?
> 
this is public mailing list which dedicated for mainline effort of spacemit SoC,
currently it's community driven, but it's not restricted to anyone,
so people are welcome to join..

> Does anybody know if https://github.com/spacemit-com/ is officially
> maintained by them ?
> 
I took over the maintenance for https://github.com/spacemit-com/linux,
other repos are took care by SpacemiT people

> Can anybody address some basic issues like
> https://github.com/spacemit-com/linux-k1x/issues/7 before even talking
> about upstreaming..
> 
please wait and be patient as SpacemiT people already respond to the issue,
besides they are off as it's the chinese new year holiday currently

BTW, for upstream, we won't bother firmware/mcu/remote in the near term as
we currently focus on very basic stuff..

> - Yanko
> 

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55
