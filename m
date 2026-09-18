Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFCF24F68DC
	for <spacemit@lists.linux.dev>; Fri, 18 Sep 2026 17:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789753247; cv=none; b=LmEFpopGi9L/fOjTUXwDwueIQtG8poRrHj5CLyKfMjelE0lbC3R3HxB4E9uuVr/w970APOiSMU7ttDJYG3m+hrv5qrTkrqCyvGhQ2D/oypLqsKeMhtq/pkdckiGCczAOnRK4tsV9dSxkHS6mQOuzhYcvRQRLrPS9GbzwTXmuUGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789753247; c=relaxed/simple;
	bh=tukjza51ngGmnD3n2gVCf+uBLCZRkX8un5dih4QbPlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=KEyyUSLMwk/JjRdIZldGLSt9OA8jxLhUCrMT/wdPlXfgXG71kMfi0ZlyeUj0T/wLYGkNxIpeNFYwEY7nsSwh2lvzlm9Mgjvg6WqUx4xlkyO7VKk+Ar/0eFHtlsUAxggSIXipKo1jjhEA/5sIASytWLYP/096zyHv6IBHOLt1H3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KuBMhv5U; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KuBMhv5U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789753242;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UtUsYSimD6K1xLItLoYKB1WWd1TCjyyOy2jIzUuov2s=;
	b=KuBMhv5UoWq/btEbzcpWvOCJ0J2G4jTk5YVFWjH2n0V41WAP2ce4T9FWmifKoi9BwpxQoe
	c0SHrASpCHAAKG6ZHApVagd0myDQRQbW4FckxCjgfspZ/lxSIHOcvIfpIguNFCL+0qfc2o
	HysTn9BF2OD3BCymu9XHliL4Fw6RCIY=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-196-N5fTwdRlMoO_As9l6r59oA-1; Fri, 18 Sep 2026 13:40:40 -0400
X-MC-Unique: N5fTwdRlMoO_As9l6r59oA-1
X-Mimecast-MFC-AGG-ID: N5fTwdRlMoO_As9l6r59oA_1789753240
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52ffe24490bso28447471cf.1
        for <spacemit@lists.linux.dev>; Fri, 18 Sep 2026 10:40:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789753240; x=1790358040;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UtUsYSimD6K1xLItLoYKB1WWd1TCjyyOy2jIzUuov2s=;
        b=d2eR+Cv7imkjMckY/sSncKufYLA4Zu0Doum6so0qQqxFxgYhIsYQiG5kUxtzNuDll5
         fukzga8xPf1rUS1i6F1LTFmSf8BpyyKwTQxGgyXXZEROJQrIdTtvZcA3ly5q4J7J+Ih1
         RiuECzCE8XOodL/4WIWowu86B4VEsxK7MZu3RzTMBunM3mgxdkEQYqsJox3ZNqvZj0+a
         6tsUwl62B6f66eOTc5qMenglbpwnJk0E+P1nrgps423K/zkvsT86g0TxxyAXA47B5NOb
         /v7uE598+eA9gMXtAcA4qrpOiGK5es+6L7+90GXH2+FKJptBLlRBNanzlfoCdTYHWyMu
         U/KA==
X-Forwarded-Encrypted: i=1; AKwUvBwtk+Zm7h1HwxnYMOlNLCiFfZNzkN33jV9KvlJH7dDFDu7dasFBraLdBIYH3J9WZTPZemGZs9kHpg==@lists.linux.dev
X-Gm-Message-State: AFuF++mlfc/L9p/VnWswfxmU+cjjjOF3rxzsMubzF60buBtQyfR7//g8
	1DBhSTXPJKT3ZgpGXBcbvNvmi+N+sShtJTYMM1B7sOX50dn1PIlS5u8xZlCTK+Wzfi9Gt/ho+Uz
	X3l6JZGC8vJMDH8MZvcg+ODtLFrqE5jegIcD6CwgDDSYkbKseuValGJDU4x8ccjOhRRzL
X-Gm-Gg: AYBFou0530a9C+MSYRM+gUvjAlUFzDhDJylZR0gdCrCMaIuBU35+66e+KyTffV8lJNQ
	k5ffYkdNxKdu+B43VXUuvPOLXKVKK0qXJwAA5kFlHB8p5zp/iIg1arzd5E3mBLg6SSTliXLulho
	NC6zIWcJOTdsNwEZFelDuoqgiGpx3Bl1yP5HJACKSPnAzezBIqPYDlXfZNSOjPGlV9oLeprsi+m
	qKVWIb0aI4NXXkM2snOzOz8Pq+6g1QwMEr2PugyysaTrLb1qILyj/Viay3D3hIwgbQHU/5f9yp2
	wjvxw6cKQp1KPrxwbtr/OXYkxt6b/pwwE6VR7hR7RLFQ7Lb74MI/z7iuiGXjTZPXCB1xGJ7ggkZ
	JqqQaLZ4bhd88586zvQQ56+nv2EwwamndzPo=
X-Received: by 2002:a05:622a:8cc:b0:532:9add:cdda with SMTP id d75a77b69052e-5329e3d11b0mr50950851cf.63.1789753239935;
        Fri, 18 Sep 2026 10:40:39 -0700 (PDT)
X-Received: by 2002:a05:622a:8cc:b0:532:9add:cdda with SMTP id d75a77b69052e-5329e3d11b0mr50950411cf.63.1789753239363;
        Fri, 18 Sep 2026 10:40:39 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532ae730a9fsm2075781cf.20.2026.09.18.10.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 10:40:38 -0700 (PDT)
Date: Fri, 18 Sep 2026 13:40:36 -0400
From: Brian Masney <bmasney@redhat.com>
To: Yixun Lan <dlan@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	linux-clk@vger.kernel.org, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] clk: spacemit: Fixes for v7.3
Message-ID: <aq13lDqmJjfDn4zI@redhat.com>
References: <20260915004456-KYC0593228@kernel.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260915004456-KYC0593228@kernel.org>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UfbKR3ApG9NNN5M8FwN5JmO7JGA_GUOu_bt6M-obwMg_1789753240
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 15, 2026 at 12:54:54AM +0000, Yixun Lan wrote:
> Hi Stephen,
> 
>    Please pull SpacemiT's clock Fixes for v7.3. This solve an issue
> that will trigger PLL clock closed due to the frequency not available
> in kernel side, a shutdown of PLL will cause the system hang.
> 
> 
> Yixun Lan
> 
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/ tags/spacemit-clk-fixes-for-7.3-1
> 
> for you to fetch changes up to d558af8ee0bb1b2e88e696be84adb93cf2b7be6f:
> 
>   clk: spacemit: k3: add CPU PLL rate tables (2026-09-15 00:09:55 +0000)

Pulled into clk-fixes.

Brian

