Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB054A01
	for <spacemit@lists.linux.dev>; Sun, 28 Sep 2025 02:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759025452; cv=none; b=N3Kr8KVX7xEZ03rO5acVTBqOjfqAWLS2UbxT16gVaP+qNzRGbtysiSlyrYZL5KQILytSCGMBmG1iKLjCA/IksX8WisO8jFD6C2QPB2GO2pRzbaD/dx4cJgSFQnQA7/67swg9VxztRQ++tjgbhCG1ghw6ryEPsJpplXs4MJfNycU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759025452; c=relaxed/simple;
	bh=uXHMtU44g8LdzdaHIpFjnIqp8AVQGjIFBiQtGjTrnt0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WfB5Ic1YfVwjdU6XPwroFZ1O9JRwmEK+LqtjcWKF+9lZb94ksgEBqWs3PqQL9HwL9hd7uCw1huwLo9aqHrOUQlJb+njhwkn3TLZzfj//OlpUoX6B/ONW84njSCfXYr6MKk1SuNN1v/9J545NLcMnSfHuZAz5Rd7RFOf/mDfNYUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=VL0drR5+; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="VL0drR5+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1759025348;
	bh=r/UU5OjQlNOk+0xgcmwYt26dsbPN+MROc0DRiB48QgY=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=VL0drR5+jAsP+/O5Q4IsDufaHhjYeQE0WVqymt6qLorw2NHW+iUlluDILqq4tcyWv
	 3qZdDTidT0lDpOXVus22POXbqofpp8Sn1R/ojJwRY4ONI9naNHICsAcynD9j4+mqcH
	 d6xjmoL75HYa+IZqqbA1tv7fOVsdQA4EtwvVSPb4=
X-QQ-mid: esmtpgz14t1759025340tfb5556f0
X-QQ-Originating-IP: OAcKHgODdTKKwX2NmUA8RS/mvctsKVecQ3y2vidb9Dk=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 28 Sep 2025 10:08:59 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3441446003025408370
EX-QQ-RecipientCnt: 13
Date: Sun, 28 Sep 2025 10:08:58 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Aurelien Jarno <aurelien@aurel32.net>, linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>, Sebastian Reichel <sre@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: "open list:SYSTEM RESET/SHUTDOWN DRIVERS" <linux-pm@vger.kernel.org>,
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH 2/2] mfd: simple-mfd-i2c: add a reboot cell for the
 SpacemiT P1 chip
Message-ID: <E15EF3B2FD46EFE7+aNiYuset7FKRo_4C@kernel.org>
References: <20250927220824.1267318-1-aurelien@aurel32.net>
 <20250927220824.1267318-3-aurelien@aurel32.net>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250927220824.1267318-3-aurelien@aurel32.net>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: MMnP0fEUKo/hsv56XtoweHVoiDlWlWwIc7F8yevwpLC1LIqZbeSwbKe/
	ut2cQn129vwhJXw73Y2k6B20CdaSrwVlAQri5Y0JjPKhZ6dJS/VdqtkX30/aGLHQ0QRotCY
	I3O182/z2Q9f6eaw4z1gKqNnIBamGEp4oVyowTbxFudlXNrWg3Kiz0kh7l4M90hujyt4JK9
	aO7wP4l+LIWlQTF+BzeWtIaMVqcwSLnWif9ZG59i8CaXWHt0Si9R+Ws74pwoh0o0nANiYim
	rlY0ncRwTDR4ubWI10kURGMQp3ThGxylQ28b7YF5FUpzBauAlDSsgnUyXijb+R2b8YLK6vq
	YO8bLiLOt3Z3R7Hf6gPV3kXh5fdSjiq4oY3AvDIM1jRAzinPbN5dj35yL4xmArq+xVJDYRV
	Ulgrpc9j5EIurKGpn9KOIfoDCoHVxh3kGqYbfikekrR4pw9xvnfGEh9S6zHW+9PGV/koDyw
	nAM2LERa2tlhAxjUCD3EZjAoGXCtBYkJ5uehddP+wWh9+RXmZD+5g3wZUBCQsyFJ/E3wD61
	xYnZ3XSEUPHmK9SBP4OrGjoXPMlH01iKn7Bo943rFLZwW++stXT7rqCX5nFK69PysC0mpB6
	nGcy4EwrZRHP88Jo6Oyxp4PjCWgRCAK3BnlDRb6DZc01CACClwlpst+laKy8ISSFWLygAMb
	P+CwzRmD0ATD+PoHyuOtz3dWvkpHDV5U6cM7Zgd7mmIfxUTw7G+P0ZLWsBzhef03Iso6PHf
	c6o2gEwBxeS/5kQH7A6/5JZpBGwWKk6GzmBctOWwJAvfM0SkaoOkR6Tp/Wb8IX1qv0obH9i
	u0/hzqLJkTUFKnWWRnVTaZrqeoAI8HmRfhkclMA/tsxe2BsbQAtFnvul9Gd8D/655AcpkFQ
	1rg9NMvQkuM2jTRXkdBHRqnSMPS2dMwK57Q1W9H7/iyHMb391gp7X66hN6MVzUfNz4qc2wN
	YeEkm4VfUqJl4cq3wWoGVw/Rmb58wMTuhUXfudbiqrweDOOHWPHEesFyJm2rAVscxLOVd9K
	W8EjrwvDMJEwP4w2pxFtiT8pT7juzswb45EYQCeNcBPgkYVrN8mnMxVrXo/R/JmLwKz2kId
	mY1zNx1JxoLbBqSUW8oDqM=
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0

Hi Aurelien, Thanks for your patch!

On Sun, Sep 28, 2025 at 12:07:41AM +0200, Aurelien Jarno wrote:
> Add a "spacemit-p1-reboot" cell for the SpacemiT P1 chip.
> 
> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> ---
>  drivers/mfd/simple-mfd-i2c.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
> index 696b602051260..2e86efb0c82b8 100644
> --- a/drivers/mfd/simple-mfd-i2c.c
> +++ b/drivers/mfd/simple-mfd-i2c.c
> @@ -99,6 +99,7 @@ static const struct regmap_config spacemit_p1_regmap_config = {
>  };
>  
>  static const struct mfd_cell spacemit_p1_cells[] = {
> +	{ .name = "spacemit-p1-reboot", },
I’m not sure if this name is the best fit here.
Since the driver also implements reboot and power-off functionality,
would it make more sense to call it spacemit-p1-power?
I’ll leave it up to you.

Otherwise, LGTM.

Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
>  	{ .name = "spacemit-p1-regulator", },
>  	{ .name = "spacemit-p1-rtc", },
>  };
> -- 
> 2.47.2
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
