Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.204.34.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919181;
	b=buWA5SpbC5/d1GHwSVzQlPAABbtbFgwohUjUW8m9RrMtjOtrwdJosOVt6BFrE+oVqaOi
	 ynD/6SLbY8BKm6Rfub6ZEZplUfhL8IaNUWX4AFtEJcpKaEWuxvKovUkPE0HLaVXUGmP2K
	 rYa08yY5O+5GtqeTUHs0LbDZsmwdDAyUsXs1NMJhhgYe7lKz9pe74Fips3etrua6JlUd3
	 qnS1coNoviENySFfREXanahXxnyToqYEc213d6EPgfVGrms25H2AY6pFUSu35vFUXiaZE
	 YXCl+51eHx0tCZZtBU6Zun465+yoYtXDrOKHRl48t+7QwxSNOzNNd8vm2G+mwW4P4Ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919181;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=nP2xuNQZsH8znbKVANuCMDP5J5Ifn7WHvFF25qlOkpM=;
	b=fMRL3V+/voFf1mckJxChG8u+yT1CKLPIHH16+tRxO/GGBygYfq9JEb6vEGXgA9JWXyC8
	 COIuldYUqYDwkhworxdaOh0gCsRYYdJqlGph/06ivNp7egP+TNnFxXZ+TNTwvRXvsBnPo
	 r5iABRRrS0AuROgppbs9QqFJJx5IoLTn9Lho0KD4iO5OtPklzCPJMlvqR/FrF+NyKnvxG
	 4sPyaaqIj+5D3kAxgw+f56EqBKjYrSGfCSGSK0WYixHAMYZ3sD4lDPUzj1uZEpGpGC5KX
	 iVgqYUi0T222W0EwFsfLuOJYo/etMD6RQnQlz60viWq65jigZorn5Hc3HZnMVHhudCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=SIT75eef;
	arc=none smtp.remote-ip=54.204.34.129
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0811C606A31C
	for <spacemit@lists.linux.dev>; Tue, 17 Nov 2026 12:39:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0811C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=SIT75eef
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794919150;
	bh=nP2xuNQZsH8znbKVANuCMDP5J5Ifn7WHvFF25qlOkpM=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=SIT75eefwQuoIcH2lZ9wzRuD9ACgU6cOyOBe3BUb3aZtKgHydvADn5mbnFl9Vodj8
	 wj66bFh1T8PNgosKLSCsxf2nOJKPhXbh25ph6FbG9E7Xe+sxjEP0gAV4rxPrmFkc49
	 nz7EyUMTl0QhIBz7NAVet/IfzJUoeLecnOcmKvrg=
X-QQ-mid: zesmtpsz6t1794919143tee230107
X-QQ-Originating-IP: +BVJx5tARnl0BqjS170OdDgH8xd/Hh14Uc1kFj+P5hU=
Received: from LT-PANJUNZHONG.dc.com ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 17 Nov 2026 20:39:01 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14536568104907117582
EX-QQ-RecipientCnt: 21
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
Date: Tue, 17 Nov 2026 20:38:46 +0800
Subject: [PATCH v5 4/9] usb: chipidea: usb2: add optional reset support
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-b4-spacemit-k1-usb2-v5-4-52c3829cca69@linux.spacemit.com>
References: <20261117-b4-spacemit-k1-usb2-v5-0-52c3829cca69@linux.spacemit.com>
In-Reply-To: <20261117-b4-spacemit-k1-usb2-v5-0-52c3829cca69@linux.spacemit.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
 Peter Chen <peter.chen@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Junzhong Pan <panjunzhong@linux.spacemit.com>, 
 Ze Huang <huang.ze@linux.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794919127; l=1684;
 i=panjunzhong@linux.spacemit.com; s=20260306; h=from:subject:message-id;
 bh=xWCWiL6/aGh6DLTIfhzIR/GNKV2px/LS4AbhROpoUhA=;
 b=2jGoPSJ7yUHk/T3cldAxJZpdWWKkHruqfp1FhzNEgrwv5rf3O37M3S+EcE2izbeMhOfX2YFfv
 CQCj/3+KGs5AAo5kxa4MEyu3e8QZNn3Af0sOExB2YxYIOTP66KDE873
X-Developer-Key: i=panjunzhong@linux.spacemit.com; a=ed25519;
 pk=bY08BOg2T9H93/jG8fEE/tVmdXoQQMp9M2rtzPFoyJg=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: MzOrCbSXFQdfaqAXeJwpOrKuQPcWuCqNqoyA0ASodfjXaz58mvjBcs5v
	JG6LeC6kASXZMzJVqwWZicChn+50HHKnwCeiaqHw2TxC5DlZTi/pr3easlNCWwujFCtcgFD
	5qYlKdevVFDuuAdiOYaFT7WflluG4OrNxwlH9NCevysmysqv2XFAPLC72V693+lfbWY60eU
	AWQuWjaEzTnik67TLxGPPh56VdzPk8sOUHW4RUbvjgtiRgCgaLJ5OHM8+4qXNwXCxO8kMEi
	JBF5jniEewir3Y38vekVAckhh1aK7SjHCng/DN5Ulw4R8FRk2dxpDfAkwpYW5aIT71j9G8d
	vqi3aKgShU0kOTJeJiA9PiunbcgnfEiaFGsR+/BNCl7r/DIxlP75Me/5qWfhWyAZOXMAtX6
	yVclH47QAjCaqoIua5iAym8Pa2ijHCcDgiF9ivHp9Hf1Uohw4SJti1Fohmb8WNNoiE1m2Wv
	MImdfOxGSiIg9QcFUdXvPes6drRuZKF2/BZUhypIASKOcW64fBWUwScPQ0cnK7m9zywzxLH
	Mw0enDSJJLhrB+esgWY5bzkyTGYMrjgktjXtcvfu3x9RmvuSPPYfPdcIepMcnlD2QuzC715
	nPuKrQRbMidhBJ9rYaJsZ90aujhwT+StVDLRToWnk7jGSizjNa0IPaJFfhDsB5sLc80VF7d
	jJhiw+hc3UGMeX/l7tu1xBqSx/cyy060p849rgku5kf5aKfaJ9ZCmc5Mcb8AeEgjN+ZSsZk
	acjXkTrKKcBtbClq8EHuwKMqjupLFRCmHJwli0Ng+xeyr38FwPFEHxNnTsLSOyLS3dlotDo
	d8hVdNr/6YuvH3KzfEB+hxH0MIE4QOn3U7SjhV6shvt7zstVry/L+ui/ljCdEPxB8B/pm3K
	nqnx7XHwnUOvIntdZHwPsM1yERuIFLSNfUPPqTms5NS/b5o68nejk4TiyaiVccuHYqniAK3
	PphIAHXLyd3ox0QAbWg45zUSKDDZiYkOzFUd8Ux/cpnKSQBiQbiCAwCi0fWsTUTzl0pbOWs
	wV43mb5naE/gPTjQKd06VnOLwhgP9YGajKZ7BfONzIy4j+rpcPclYSzobW7agOJGcB6RtcX
	Hoh6OkpPFA0XOvJZtg8Yesd8sUbf7eWYwJbcQ3MuLTFbrnVQoJ4eNEtoQZLs5Rt6sCPR3rp
	LecdDgLQ5TF1avBVQC0xTZjR9dftiLo65YMWqdepGAyqMMw=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0

The USB2 controller of SpacemiT K1 SoC requires reset support, to keep
compatibility, add optional reset support.

Tested-by: Ze Huang <huang.ze@linux.dev>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Reviewed-by: Yixun Lan <dlan@kernel.org>
Acked-by: Peter Chen <peter.chen@kernel.org>
Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
---
 drivers/usb/chipidea/ci_hdrc_usb2.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/chipidea/ci_hdrc_usb2.c b/drivers/usb/chipidea/ci_hdrc_usb2.c
index a353281e4e37..8cf13f0bae3f 100644
--- a/drivers/usb/chipidea/ci_hdrc_usb2.c
+++ b/drivers/usb/chipidea/ci_hdrc_usb2.c
@@ -12,6 +12,7 @@
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
+#include <linux/reset.h>
 #include <linux/usb/chipidea.h>
 #include <linux/usb/hcd.h>
 #include <linux/usb/ulpi.h>
@@ -48,6 +49,7 @@ static int ci_hdrc_usb2_probe(struct platform_device *pdev)
 	struct ci_hdrc_platform_data *ci_pdata = dev_get_platdata(dev);
 	const struct ci_hdrc_platform_data *data;
 	struct clk *clk;
+	struct reset_control *reset;
 	int ret;
 
 	if (!ci_pdata) {
@@ -67,6 +69,11 @@ static int ci_hdrc_usb2_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(clk),
 				     "failed to get or enable the clock\n");
 
+	reset = devm_reset_control_get_optional_exclusive_deasserted(dev, NULL);
+	if (IS_ERR(reset))
+		return dev_err_probe(dev, PTR_ERR(reset),
+				     "failed to get or deassert the reset control\n");
+
 	ci_pdata->name = dev_name(dev);
 
 	ci_pdev = ci_hdrc_add_device(dev, pdev->resource,

-- 
2.34.1

