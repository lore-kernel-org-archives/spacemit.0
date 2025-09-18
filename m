Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F126530CDAC
	for <spacemit@lists.linux.dev>; Thu, 18 Sep 2025 15:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758210260; cv=none; b=gVOJjH93YN3IQoj8Ejw4PgrgU+bXR7g1WeDXVWlxbbUemEmzmKIfZkhPqN3WoUbI9tLuTDj2RsNrc3VKxceHeVAcxQveE236XqKB8mGR6EcElCO6VeG4N6YunzEkNKZaR7E002rX91+aQJhbdZbziW+qr401SVmiK4dI94kOYVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758210260; c=relaxed/simple;
	bh=2Tb9OeqfqChMAE/bW8nihG5bBkS+86woGLLzweX2qi0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BbXHHDxCL6oNKzQ8WhteeN7Lj6Ix5BS9DlI8WLzFmD1okmYH/2XiEL/0C6L85gLagHXs5rr7OnFBhdQXjaMm0o1OhW58d75V2O7ziz3i+IfIocltQcCYQwyjc7siqDluKZQ7o7VP5mN0ZpRagTnw6tdjg8d0U8aw4mXl1AozvbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=jSI51V+P; arc=none smtp.client-ip=209.85.166.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="jSI51V+P"
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-893661db432so39996939f.1
        for <spacemit@lists.linux.dev>; Thu, 18 Sep 2025 08:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1758210258; x=1758815058; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IYhrldrOGtsDoKDXkPai5Tm2eHb8T6uZE7LbE34+y/M=;
        b=jSI51V+PnOz+9i7WeSEZF+lOkdbdK+9fqQffaPG9NGYwNkv9wONse6VhbLRpBFB2Nq
         YQ0PyKuVXP1loHUXCLjHkjVpgSOkFOiujzSlaQlk9s5F6RW/TFdgchfVHMSOC1aEKIkN
         J3DeFpZG/CJvZ7AqH85ysrImS5DYzHlsmW4HJfzxkZ0Bk31tJmvLtklmgHzS1K0h3Cml
         YQzHLvZG04oamC1Kl1gtb29ufGtzgU5uscTk+t8l2rUHjj2P4PCWu1XZlVKTW16WAlNt
         I5cha/RYxjDzXl3GhqKbBn8OkhXHtd2eWNqHPxe/nsuvBqwi8uikJY0cS3adugsuXzxH
         aSbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758210258; x=1758815058;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IYhrldrOGtsDoKDXkPai5Tm2eHb8T6uZE7LbE34+y/M=;
        b=vZkjooD6npxA7yELt+Hv3XMGskaL/2Wynao1lobv7jX+RYPH24YANk6GKInl67bfUF
         iMkhdJJ+iPxAXHBQloEUUNe4ONCbIUaGa+vim7+Vd6ccKwHHw4nwQtkLFzeFqA9G1UgW
         pvVtoOFasD5YJ5rd1HXDIY+/mN/SPzIbSMnFu9/7UeOgBTSqOaIeQjhjth2Hmnjb5uzP
         KWDUgNqWKYNTNIWadZ4j+YELiYzRbrVgTxK0JwjNZk9ylYK5rCkF6Tr6CLded10HAXSp
         fkZ2uySdroME/CuocKoQIiQelhbI8Cd7uPPzNBGb7gT3ZuJV0SG3IiF8gEq3/MEV02Qk
         vhVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjHNsVxDUrT1oAZ3kw09cT5pmeQh9tqtxHhsWTzUBDw6/eIX159cG5UTwWcOKWHcpjCctnEOG9jA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzOr9fGfKMX/bpTGVqUEZj3cYc43WP7JUc6I1AkixVRhdDXFitx
	HjfUzG6q3rd3sZqPawZD31n36Y9lXjQ9xXqyGQ1UVWGVodpKYrk3r5hII7oCWjdVCAs=
X-Gm-Gg: ASbGncsaq4qSK0GIwozGgfqs404aSRi714+8vK1jmFxnwUhR7+dGgMXbVRc+XWUmkVI
	fC4puj5IC/PH6ncR6qrrHktTbmPlq+Uy/Ibt8M99W3pGktUq1+2b4apANL4lwsyn0EpVyj6NwPq
	296J3BGQMXfDBZ0KJSMJQbHwx0RjzfSmVGTluJLMS7R3OWQJv/7ZAokqbANmrg+h9jTzmuzjsUp
	AAVBrEwu4nreVlcn/84+OYU/JFMrWRUkW1blBZqX+X/wzIeemT1KgF9Zia/UJv8L3nDHPFdLroM
	YDrzm0NjOYikxiN6XpoGgRKt2IhV5wbThRh4T1oYuf1/SLC/msUFGMwXEttLrI0+N1jiKO4weJY
	lODRWlE0OHx5E7CtQX/g974ecjVr5z4JRkhWub/gbEZYipcl0tN2WA/tfJGjro2CyE6yV8XRDQr
	vvSQKzVA==
X-Google-Smtp-Source: AGHT+IHyY949yC9PkpeT/QOBqAaxoqc0DHrnN3CUC5h5A0iVJ6RUW339AkYSX5xvq1CVEEDiEGOZ/w==
X-Received: by 2002:a05:6602:2c95:b0:887:50ab:5c8c with SMTP id ca18e2360f4ac-89d28b42cb0mr960281739f.12.1758210251747;
        Thu, 18 Sep 2025 08:44:11 -0700 (PDT)
Received: from [172.22.22.234] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-53d560d3993sm1050465173.67.2025.09.18.08.44.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 08:44:11 -0700 (PDT)
Message-ID: <057f2f54-c370-455c-95ca-83f97d884f3f@riscstar.com>
Date: Thu, 18 Sep 2025 10:44:10 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] spi: spacemit: introduce SpacemiT K1 SPI controller
 driver
To: Yixun Lan <dlan@gentoo.org>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, p.zabel@pengutronix.de, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250917220724.288127-1-elder@riscstar.com>
 <20250917220724.288127-3-elder@riscstar.com>
 <20250918124120-GYA1273705@gentoo.org>
 <034cecd3-c168-4c8d-9ad5-10cc1853894b@riscstar.com>
 <20250918143928-GYB1274501@gentoo.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250918143928-GYB1274501@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/18/25 9:39 AM, Yixun Lan wrote:
>>>> +	void *bufp = io->buf ? : dummy;
>>> simply s/bufp/buf/, embed pointer info into variable doesn't really help
>>> let's leave compiler to check
>> I called it "buf" originally and changed it to "bufp" because it
>> actually advances through the buffer (either the one in the IO
>> structure or the dummy buffer) in the loop.
>>
>> I don't understand your comment about the compiler.
>>
> for the compiler to check the type.. because people could even name it as
> 	u32 bufp;

OK now I see what you're saying.  To me, "bufp" as a pointer
that moves through a buffer; it would normally be initialized
to "buf".  Where used, "buf" doesn't change (points to the
start of the buffer), while "bufp" does.

It is an established convention, so at least to me it's carries
that meaning.  I am *not* using the "p" to indicate it's a
pointer.

I looked around for some examples, and there aren't a ton of
them, but here are a few:
   setup_dma_scatter()
   __cmdline_find_option()
   tmc_etb_dump_hw()
   dnet_start_xmit()

I'm planning to keep it "bufp".

					-Alex



