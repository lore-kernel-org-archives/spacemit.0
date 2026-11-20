Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795164626;
	b=wpnvc56CQyaAP4UwJYhBm3wnnygIaVxanTcEAUbNxX+XxWJ4HOrE2e4FALePhN1F3IEd
	 tVgnzRg/Op7FHmKkk4CTt/20u2hu0J5Fzo/P3COnUKrSlmPh92w6wh1uN+s9ahTBFAO8+
	 2//8a3YSDkrquI2WkbIYq1c1IvQWbriOVrN5RxFDgrFB3dj5Frv2wID67IcCKTTsq8Xoy
	 cMv2Tv9CqdNY6JxHkB57UU9TaSmAFjflqjZcl8VdSEzhdwKmJhS3Kuwg4WiQKB49KkdPk
	 QdoiFUIRuLOOLOZ8fzIXq+qiqsZKCr1MhRpYAPl/JC6GEP4ZPlsUFQpYEOQ2/m0u6kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795164626;
	h=DMARC-Filter:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:
	 X-CM-SenderInfo;
	bh=3W4UX72q3nL7QnYTdyMxZRoIYC/nbsvY/bEqG/17nyE=;
	b=DUXjasqQa5oNnWqmeRUwd3YHJY8sOKQrqBeZWtLrkbAsgkISCdCFaJTghHoLYxppL/TS
	 OWQAs/m9h9rYpQWprfOniXw0yQ3SObWsLBJ2c5lCCm0/a+ovykkZKlaAEa1pxoDWNi3eo
	 oj7sCRaDFkFGPdMDr3Lrkt18uk/Nh56ZA4UbfRJ5Z9EGoigOV18UI+VFWd0tzaW0pxwD4
	 Gggcs5e21yGo4qMyOZ8/w05Az4zVVVMULWv+r7AF6yk63ji3kL8DwwTH4dP869sAP1hza
	 iBOi1zoYjfvLSq8U9Wa1wJDW61QWg/ffK9cgiJxFfbLox08PK+BGKSCC/EMDVzMqjdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.81
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C1F606A338
	for <spacemit@lists.linux.dev>; Fri, 20 Nov 2026 08:50:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0C1F606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [127.0.0.2] (unknown [123.116.51.226])
	by APP-03 (Coremail) with SMTP id rQCowACHkpPFCQBrNdxnAQ--.12681S2;
	Fri, 20 Nov 2026 16:50:15 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Date: Fri, 20 Nov 2026 16:47:44 +0800
Subject: [PATCH] mailmap: Update Vivian Wang's email address
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
Message-Id: <20261120-update-email-v1-1-b7e080827c7c@iscas.ac.cn>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2N2wrCMBAFfyXss5EkXir9lVIhSbe6YtqaSxFC/
 t1ofRyYMydDQE8YoGUZPK4UaJ4qyB0De9fTDTkNlUEJdZZSCZ6WQUfk6DQ9uWnEAS9WnUYroE4
 WjyO9f7mu3zgk80Abv42/4fGV6k/cNDA6ILezcxRbtjb7I/dWXnOBvpQPDL3BPJ8AAAA=
X-Change-ID: 20261120-update-email-b703e8c25fc0
To: linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Cc: Vivian Wang <dram+linux@dram.page>
X-Mailer: b4 0.15.2
X-CM-TRANSID:rQCowACHkpPFCQBrNdxnAQ--.12681S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtF1kZF1UtryxJw4fGFWfZrb_yoWDtrg_K3
	WrtrykurWkAFn8KrnxXFs3Cr1F93s7tr1jgwn8Jr9xZFy3KFn3CrWkCFWa9a4DXrykWr9r
	Gr1avFZYvFn3ZjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb2kYjsxI4VWxJwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF
	04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r
	18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vI
	r41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr
	1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvE
	x4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8mXdUUUUUU==
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/

I am leaving ISCAS in December of 2026. Redirect future mail to my
personal address.

Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index 0d05be949eff..1e518c12123c 100644
--- a/.mailmap
+++ b/.mailmap
@@ -993,6 +993,7 @@ Viresh Kumar <vireshk@kernel.org> <viresh.linux@gmail.com>
 Viresh Kumar <viresh.kumar@linaro.org> <viresh.kumar@linaro.com>
 Vishnu Dasa <vishnu.dasa@broadcom.com> <vdasa@vmware.com>
 Vivek Aknurwar <quic_viveka@quicinc.com> <viveka@codeaurora.org>
+Vivian Wang <dram+linux@dram.page> <wangruikang@iscas.ac.cn>
 Vivien Didelot <vivien.didelot@gmail.com> <vivien.didelot@savoirfairelinux.com>
 Vlad Dogaru <ddvlad@gmail.com> <vlad.dogaru@intel.com>
 Vladimir Davydov <vdavydov.dev@gmail.com> <vdavydov@parallels.com>

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261120-update-email-b703e8c25fc0

Best regards,
--  
Vivian "dramforever" Wang

